output "ecs_cluster" {
  description = "ECS cluster name"
  value       = aws_ecs_cluster.cluster.id
}

output "capacity_provider" {
  description = "ECS capacity provider"
  value       = aws_ecs_cluster_capacity_providers.provider.id
}

output "task_definition" {
  description = "ECS task definition"
  value       = aws_ecs_task_definition.ecs_task_definition.arn
}

output "ecs_sg_id" {
  description = "ECS security group ID"
  value       = aws_security_group.ecs_sg.id
}

output "ecs_service" {
  description = "ECS service name"
  value       = aws_ecs_service.service.arn
}