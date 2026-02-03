output "vpc_id" {
  description = "The ID of the newly created VPC"
  value       = aws_vpc.threat-composer.id
}

output "alb_arn" {
  description = "The ARN of the Application Load Balancer"
  value       = aws_lb.alb_threat_composer.arn
}

output "listener_arn" {
  description = "The ARN of the ALB listener"
  value = aws_lb_listener.listener.arn
}

output "lb_sg_id" {
  description = "The ID of the https security group"
  value       = aws_security_group.lb_sg.id
}


output "target_group_arn" {
  description = "The ARN of the target group"
  value = aws_lb_target_group.alb_tg.arn
}

output "alb_zone_id" {
  description = "The zone_id of the ALB"
  value       = aws_lb.alb_threat_composer.id
}

output "lb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.alb_threat_composer.dns_name
}
