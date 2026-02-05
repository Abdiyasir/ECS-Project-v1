resource "aws_lb" "alb_threat_composer" {
  name               = "alb-threat-composer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = [var.public-1_subnet, var.public-2_subnet]

  enable_deletion_protection = true
}

resource "aws_security_group" "lb_sg" {
  name = "lb_sg"
  vpc_id = var.vpc_id

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}



resource "aws_lb_target_group" "alb_tg" {
  name        = "alb-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.threat-composer.id
 
  health_check {
    path                = "/health"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}


resource "aws_vpc" "threat-composer" {
  cidr_block = var.vpc_cidr
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn         = aws_lb.alb_threat_composer.arn
  port                      = "80"
  protocol                  = "HTTP"
  certificate_arn = var.certificate_arn

  default_action {
    type                    = "forward"
    target_group_arn        = aws_lb_target_group.alb_tg.arn
  }
}
