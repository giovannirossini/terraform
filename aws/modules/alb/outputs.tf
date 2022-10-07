output "dns_name" {
  description = "The DNS name of the ALB"
  value       = aws_lb.alb.dns_name
}