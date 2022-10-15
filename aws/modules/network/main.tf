data "aws_region" "current" {}

resource "aws_vpc" "vpc" {
  cidr_block                       = var.vpc_cidr
  enable_dns_support               = true
  enable_dns_hostnames             = true
  enable_classiclink_dns_support   = true
  enable_classiclink               = true
  assign_generated_ipv6_cidr_block = true
  tags = {
    Name = var.name
  }
}

resource "aws_internet_gateway" "gw" {
  depends_on = [aws_vpc.vpc]
  vpc_id     = aws_vpc.vpc.id
  tags = {
    Name = var.name
  }
}

resource "aws_default_route_table" "route" {
  depends_on             = [aws_vpc.vpc, aws_internet_gateway.gw]
  default_route_table_id = aws_vpc.vpc.default_route_table_id
  route {
    cidr_block = var.public_cidr
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = var.name
  }
}

resource "aws_subnet" "subnet" {
  depends_on              = [aws_vpc.vpc]
  count                   = length(var.subnets_cidr)
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = join("", [data.aws_region.current.name, element(var.az, count.index)])
  cidr_block              = element(var.subnets_cidr, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet${count.index + 1}"
  }
}

resource "aws_route_table_association" "route-association" {
  depends_on     = [aws_subnet.subnet, aws_default_route_table.route]
  count          = length(var.subnets_cidr)
  subnet_id      = element(aws_subnet.subnet.*.id, count.index)
  route_table_id = aws_default_route_table.route.id
}
