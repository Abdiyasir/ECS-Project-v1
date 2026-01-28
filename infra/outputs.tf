  output "vpc_id" {
  description = "The ID of the newly created VPC"
  value       = module.vpc.vpc_id
}

output "EIP-1_allocation" {
  description = "The first public IP address of the Elastic IP"
  value       = module.vpc.EIP-1_allocation
}

output "EIP-2_allocation" {
  description = "The second public IP address of the Elastic IP"
  value       = module.vpc.EIP-2_allocation
}