
resource "aws_route53_record" "cert_validation" {
  depends_on = [aws_acm_certificate.cert]
  name       = aws_acm_certificate.cert.domain_validation_options.0.resource_record_name
  type       = aws_acm_certificate.cert.domain_validation_options.0.resource_record_type
  zone_id    = var.zone_id
  records    = [aws_acm_certificate.cert.domain_validation_options.0.resource_record_value]
  ttl        = 60
}