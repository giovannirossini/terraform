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
  depends_on              = [aws_key_pair.sshkey]
  count                   = var.instances_number
  ami                     = var.ami != "" ? var.ami : data.aws_ami.ubuntu.id
  instance_type           = var.instance_type
  key_name                = aws_key_pair.sshkey.key_name
  availability_zone       = join("", ["${data.aws_region.current.name}","${element(var.az,0)}"])
  tenancy                 = "default"
  subnet_id               = var.subnet_id
  ebs_optimized           = var.ebs_optimized
  vpc_security_group_ids  = [var.sg_id]
  source_dest_check       = true
  monitoring              = var.monitoring
  root_block_device {
    volume_size           = var.volume_size
    volume_type           = "gp2"
    delete_on_termination = var.delete_on_termination
    encrypted             = var.encrypted
  }
  tags                    = {
    Name                  = "${var.name}-${count.index + 1}"
  }
}

resource "aws_eip" "eip" {
  depends_on              = [aws_instance.ec2]
  count                   = length(aws_instance.ec2[*].id)
  instance                = aws_instance.ec2[count.index].id
  vpc                     = true
  tags                    = {
    Name                  = "${var.name}-${count.index + 1}"
  }
}