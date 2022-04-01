output "sg_rds_id" {
  description = "The ID of the RDS security group."
  value       = aws_security_group.sg_rds.id
}

output "sg_default_id" {
  description = "The ID of the default, ssh, security group."
  value       = aws_security_group.sg_default.id
}

output "sg_alb_id" {
  description = "The ID of the ALB security group."
  value       = aws_security_group.sg_alb.id
}

output "sg_efs_id" {
  description = "The ID of the EFS security group."
  value       = aws_security_group.sg_efs.id
}

output "sg_redis_id" {
  description = "The ID of the Redis security group."
  value       = aws_security_group.sg_redis.id
}
output "sg_elasticsearch_id" {
  description = "The ID of the Elasticsearch security group."
  value       = aws_security_group.sg_elasticsearch.id
}
output "vpc_id" {
  description = "The ID of the VPC."
  value       = aws_vpc.vpc_production.id
}
output "subnet" {
  description = "The IDs of the subnets."
  value       = aws_subnet.EC2Subnet.*.id
}