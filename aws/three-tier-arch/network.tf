data "aws_vpc" "current" {
  default = true
}

data "aws_subnets" "current" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.current.id]
  }
}
