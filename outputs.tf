
output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.main.id
}

output "subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.public.id
}

output "security_group_id" {
  description = "ID of the security group"
  value       = aws_security_group.web.id
}

output "instance_id" {
  description = "ID of the simulated EC2 instance"
  value       = aws_instance.web.id
}

output "s3_bucket_name" {
  description = "Name of the simulated S3 bucket"
  value       = aws_s3_bucket.app.id
}
