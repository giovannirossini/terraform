output "rds_password" {
  description = "RDS Password"
  value       = module.rds.password
}

output "rds_endpoint" {
  description = "RDS Endpoint"
  value       = module.rds.endpoint
}

output "route53_zone_id" {
  description = "Route53 Zone ID"
  value       = module.route53.id
}

output "efs_id" {
  description = "EFS ID"
  value       = module.efs.id
}

output "ec2_id" {
  description = "The ID of the EC2 instance"
  value       = module.ec2.*.id
}

output "ec2_ip" {
  description = "The IP address of the EC2 instance"
  value       = module.ec2.*.public_ip
}

output "ec2_dns" {
  description = "The DNS name of the EC2 instance"
  value       = module.ec2.*.public_dns
}

output "alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = module.loadbalancer.dns_name
}

output "eks_endpoint" {
  value = module.eks.endpoint
}