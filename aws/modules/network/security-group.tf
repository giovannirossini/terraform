resource "aws_security_group" "sg_default" {
  depends_on  = [aws_vpc.vpc]
  name        = "SSH"
  description = "Allow SHH inbound traffic"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    description = "SSH"
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = [var.public_cidr]
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = [var.public_cidr]
  }
}

resource "aws_security_group" "sg_alb" {
  depends_on  = [aws_vpc.vpc]
  name        = "Application Load Balance"
  description = "Allow ALB traffic"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    description = "LoadBalancer"
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = [var.public_cidr]
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = [var.public_cidr]
  }
}

resource "aws_security_group" "sg_elasticsearch" {
  depends_on  = [aws_vpc.vpc]
  description = "Allows access to Elasticsearch Service"
  name        = "Elasticsearch Service"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    description = "VPC"
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = [var.vpc_cidr]
  }
  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = [var.public_cidr]
  }
}

resource "aws_security_group" "sg_efs" {
  depends_on  = [aws_vpc.vpc]
  description = "Allow access to EFS"
  name        = "EFS"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    description = "VPC"
    protocol    = "tcp"
    from_port   = 2049
    to_port     = 2049
    cidr_blocks = [var.vpc_cidr]
  }
  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = [var.public_cidr]
  }
}

resource "aws_security_group" "sg_redis" {
  depends_on  = [aws_vpc.vpc]
  description = "Allow access to Redis "
  name        = "Redis"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    description = "VPC"
    protocol    = "tcp"
    from_port   = 6379
    to_port     = 6379
    cidr_blocks = [var.vpc_cidr]
  }
  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = [var.public_cidr]
  }
}

resource "aws_security_group" "sg_rds" {
  depends_on  = [aws_vpc.vpc]
  description = "Allow access to RDS "
  name        = "RDS"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    description = "VPC"
    protocol    = "tcp"
    from_port   = 3306
    to_port     = 3306
    cidr_blocks = [var.vpc_cidr]
  }
  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = [var.public_cidr]
  }
}