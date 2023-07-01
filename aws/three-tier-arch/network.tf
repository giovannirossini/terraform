module "network" {
  source               = "git@github.com:giovannirossini/terraform.git//aws/modules/network"
  name                 = "vpc-${local.name}"
  az                   = ["a", "b", "c"]
  vpc_cidr             = "100.0.0.0/16"
  public_subnets_cidr  = ["100.0.1.0/24", "100.0.2.0/24", "100.0.3.0/24"]
  private_subnets_cidr = ["100.0.101.0/24", "100.0.102.0/24", "100.0.103.0/24"]
}

resource "aws_security_group" "sg_alb" {
  name        = "Application Load Balance"
  description = "Allow ALB traffic"
  vpc_id      = module.network.vpc_id
  ingress {
    description = "LoadBalancer"
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = [module.network.vpc_cidr]
  }
}

resource "aws_security_group" "sg_instance" {
  name        = "Instance Security Group"
  description = "Allow incoming traffic from ALB"
  vpc_id      = module.network.vpc_id

  ingress {
    description     = "ALB access"
    protocol        = "tcp"
    from_port       = 80
    to_port         = 80
    security_groups = [aws_security_group.sg_alb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}
