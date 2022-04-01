data "aws_region" "current" {}

resource "aws_vpc" "vpc_production" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = var.name
  }
}

resource "aws_internet_gateway" "gw" {
  depends_on = [aws_vpc.vpc_production]
  vpc_id     = aws_vpc.vpc_production.id
  tags = {
    Name = var.name
  }
}

resource "aws_default_route_table" "r" {
  depends_on             = [aws_vpc.vpc_production, aws_internet_gateway.gw]
  default_route_table_id = aws_vpc.vpc_production.default_route_table_id
  route {
    cidr_block = var.public_cidr
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = var.name
  }
}

resource "aws_subnet" "EC2Subnet" {
  depends_on              = [aws_vpc.vpc_production]
  count                   = length(var.subnets_cidr)
  vpc_id                  = aws_vpc.vpc_production.id
  availability_zone       = join("", ["${data.aws_region.current.name}", "${element(var.az, count.index)}"])
  cidr_block              = element(var.subnets_cidr, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet${count.index + 1}"
  }
}