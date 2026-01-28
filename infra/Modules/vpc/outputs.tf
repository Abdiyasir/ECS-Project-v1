output "vpc_id" {
  description = "The ID of the newly created VPC"
  value       = aws_vpc.threat-composer.id
}

output "EIP-1_allocation" {
  description = "The first public IP address of the Elastic IP"
  value       = aws_eip.ngw-1.id
}

output "EIP-2_allocation" {
  description = "The second public IP address of the Elastic IP"
  value       = aws_eip.ngw-2.id
}