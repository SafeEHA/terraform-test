output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.simple_instance.public_ip
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.simple_vpc.id
}