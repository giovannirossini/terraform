output "id" {
  description = "The ID of the EC2 instance"
  value = aws_instance.ec2.*.id
}

output "public_ip" {
  description = "The IP address of the EC2 instance"
  value = aws_eip.eip.*.public_ip
}

output "public_dns" {
  description = "The DNS name of the EC2 instance"
  value = aws_eip.eip.*.public_dns
}