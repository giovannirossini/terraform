output "vpc_id" {
  description = "The ID of the VPC."
  value       = aws_vpc.vpc.id
}

output "vpc_cidr" {
  description = "The CIDR of the VPC."
  value       = aws_vpc.vpc.cidr_block
}

output "subnet" {
  description = "The IDs of the subnets."
  value       = aws_subnet.subnet.*.id
}

output "subnet_cidr" {
  description = "The CIDR of the subnets."
  value       = aws_subnet.subnet.*.cidr_block
}

output "region" {
  description = "The current region"
  value       = data.aws_region.current
}