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

output "public-1_subnet" {
  description = "The Public subnet 1 ID"
  value       = aws_subnet.public-1.id
}

output "public-2_subnet" {
  description = "The Public subnet 2 ID"
  value       = aws_subnet.public-2.id
}

output "private-1_subnet" {
  description = "The private subnet 1 ID"
  value       = aws_subnet.private-1.id
}

output "private-2_subnet" {
  description = "The private subnet 2 ID"
  value       = aws_subnet.private-2.id
}

output "Internet_gateway" {
  description = "The internet gateway ID"
  value       = aws_internet_gateway.igw.id
}

output "Nat_gateway_1" {
  description = "The first Nat gateway ID"
  value       = aws_nat_gateway.ngw-1.id
}

output "Nat_gateway_2" {
  description = "The second Nat gateway ID"
  value       = aws_nat_gateway.ngw-2.id
}