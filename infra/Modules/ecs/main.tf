resource "aws_ecs_cluster" "cluster" {
  name = "threat-composer-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_cluster_capacity_providers" "provider" {
  cluster_name = aws_ecs_cluster.cluster.name

  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    base              = 2
    weight            = 1
    capacity_provider = "FARGATE"
  }
}

resource "aws_ecs_task_definition" "ecs_task_definition" {
  family = var.ecs_family
  network_mode       = "awsvpc"
  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn
  requires_compatibilities = ["FARGATE"]
  cpu          = 256
  memory    = 512
  runtime_platform {
   operating_system_family = "LINUX"
   cpu_architecture        = "X86_64"
 }
  container_definitions = jsonencode([
    {
      name      = var.container_name
      image     = var.image_uri
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
        }
      ]
    },
  ])
}

resource "aws_security_group" "ecs_sg" {
  name        = "ecs_sg"
  vpc_id      = var.vpc_id

  ingress {
    protocol        = "tcp"
    from_port       = 8080
    to_port         = 8080
    security_groups = [var.lb_sg_id]
  
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_ecs_service" "service"{
  name            = "ecs_service"
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.ecs_task_definition.arn
  desired_count   = var.task_count
  launch_type     = "FARGATE"
  health_check_grace_period_seconds = 120

  network_configuration {
    subnets          = [var.private-1_subnet, var.private-2_subnet]
    security_groups  = [aws_security_group.ecs_sg.id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = var.container_name
    container_port   = var.container_port
  }

  
depends_on = [var.listener_arn]
}
