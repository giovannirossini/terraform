output "id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.ec2.*.id
}

output "public_ip" {
  description = "The IP address of the EC2 instance"
  value       = aws_eip.eip.*.public_ip
}

output "public_dns" {
  description = "The DNS name of the EC2 instance"
  value       = aws_eip.eip.*.public_dns
}

output "ssh_key" {
  description = "The SSH key name"
  value       = aws_instance.ec2.*.key_name
}

output "name" {
  description = "The name of the EC2 instance"
  value       = aws_instance.ec2.*.tags.Name
}