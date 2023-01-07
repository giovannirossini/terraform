output "web_acl_id" {
  description = "The ID of the Web ACL."
  value       = aws_waf_web_acl.web_acl.id
}