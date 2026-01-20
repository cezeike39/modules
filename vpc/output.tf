output "private_subnet_ids" {
  value       = aws_subnet.private[*].id
  description = "IDs of all private subnets"
}
output "public_subnet_ids" {
  value       = aws_subnet.public[0].id
  description = "IDs of all public subnets"
}
output "vpc_id" {
  value       = aws_vpc.main.id
  description = "VPC ID"
}

