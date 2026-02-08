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

output "alb_arn" {
  description = "The ARN of the Application Load Balancer"
  value       = module.alb.alb_arn
}

output "listener_arn" {
  description = "The ARN of the ALB listener"
  value       = module.alb.listener_arn
}

output "lb_sg_id" {
  description = "The ID of the https security group"
  value       = module.alb.lb_sg_id
}

output "target_group_arn" {
  description = "The ARN of the target group"
  value       = module.alb.target_group_arn
}

output "alb_zone_id" {
  description = "The zone_id of the ALB"
  value       = module.alb.alb_zone_id
}

output "lb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = module.alb.lb_dns_name
}

