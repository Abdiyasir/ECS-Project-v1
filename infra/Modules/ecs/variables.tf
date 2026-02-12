variable "ecs_family" {
  type        = string
  description = "ECS family name"

}

variable "image_uri" {
  type        = string
  description = "Docker image URI"

}

variable "container_name" {
  type        = string
  description = "Name of ECS container"

}

variable "target_group_arn" {
  type        = string
  description = "ALB target group arn"

}
variable "vpc_id" {
  type        = string
  description = "The ID of the newly created VPC"

}

variable "private-1_subnet" {
  type        = string
  description = "Private 1 subnet CIDR block"

}

variable "private-2_subnet" {
  type        = string
  description = "Private 2 subnet CIDR block"

}

variable "listener_arn" {
  type        = string
  description = "The ARN of the ALB listener"

}

variable "task_count" {
  type        = string
  description = "Numer of ECS tasks"

}

variable "container_port" {
  type        = number
  description = "ECS container port"

}

variable "lb_sg_id" {
  type        = string
  description = "ALB security group"

}