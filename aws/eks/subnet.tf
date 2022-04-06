data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "eks_subnet" {
  count                   = 2
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  cidr_block              = cidrsubnet("10.0.0.0/16", 8, count.index + 4)
  map_public_ip_on_launch = true
  vpc_id                  = var.vpc_id

  tags = {
    "kubernetes.io/cluster/${aws_eks_cluster.cluster.name}" = "shared"
  }
}