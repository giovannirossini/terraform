output "id" {
  description = "The ID of the DNS Zone."
  value = aws_route53_zone.main.zone_id
}