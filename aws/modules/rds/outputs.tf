output "endpoint" {
  description = "The endpoint of the RDS"
  value       = aws_rds_cluster.cluster.endpoint
}

output "password" {
  description = "The password of the RDS"
  sensitive   = false
  value       = random_password.password.result
}