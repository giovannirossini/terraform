data "aws_region" "current" {}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ec2" {
  count                  = 2
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3a.micro"
  tenancy                = "default"
  ebs_optimized          = false
  source_dest_check      = true
  subnet_id              = element(module.network.private_subnet, count.index)
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.profile.name
  root_block_device {
    volume_size           = 8
    volume_type           = "gp3"
    delete_on_termination = true
    encrypted             = false
  }
  tags = {
    Name = "${local.name}-${local.component}-${count.index + 1}"
  }
  volume_tags = {
    Name = "${local.name}-${local.component}-${count.index + 1}"
  }

  user_data = templatefile("${path.module}/templates/user_data", {
    lambda_name = "/teste"
  })
}

module "loadbalancer" {
  source      = "git@github.com:giovannirossini/terraform.git//aws/modules/alb"
  name        = "${local.name}-${local.component}"
  instance_id = [for i in aws_instance.ec2[*].id : i]
  sg_id       = [aws_security_group.sg_alb.id]
  vpc_id      = module.network.vpc_id
  subnets     = module.network.public_subnet
}

resource "aws_iam_policy" "lambda_access_policy" {
  name        = "LambdaAccessPolicy"
  description = "Policy to allow access to all Lambda functions"

  policy = file("${path.module}/templates/frontend.json")
}

resource "aws_iam_role" "instance_role" {
  name = "Frontend2Backend"

  assume_role_policy = file("${path.module}/templates/ec2.json")
}

resource "aws_iam_role_policy_attachment" "instance_policy_attachment" {
  role       = aws_iam_role.instance_role.name
  policy_arn = aws_iam_policy.lambda_access_policy.arn
}

resource "aws_iam_instance_profile" "profile" {
  name = "${local.name}-${local.component}"
  role = aws_iam_role.instance_role.name
}
