module "vpc" {
  source           = "./Modules/vpc"
  vpc_cidr         = var.vpc_cidr
  public-1_subnet  = var.public-1_subnet
  public-2_subnet  = var.public-2_subnet
  private-1_subnet = var.private-1_subnet
  private-2_subnet = var.private-2_subnet
  az-1             = var.az-1
  az-2             = var.az-2
  igw_cidr         = var.igw_cidr
  ngw-1_cidr       = var.ngw-1_cidr
  ngw-2_cidr       = var.ngw-2_cidr
}

module "alb" {
  source          = "./Modules/alb"
  vpc_id          = module.vpc.vpc_id
  vpc_cidr        = var.vpc_cidr
  public-1_subnet = module.vpc.public-1_subnet
  public-2_subnet = module.vpc.public-2_subnet
  certificate_arn = module.acm.certificate_arn
}

module "acm" {
  source      = "./Modules/acm"
  cert_name = var.cert_name
  domain_name = var.domain_name
}

module "ecs" {
  source      = "./Modules/ecs"
  vpc_id = module.vpc.vpc_id
  container_name = var.container_name
  private-1_subnet = module.vpc.private-1_subnet
  private-2_subnet = module.vpc.private-2_subnet
  container_port = var.container_port
  task_count = var.task_count
  listener_arn = module.alb.listener_arn
  ecs_family = var.ecs_family
  target_group_arn = module.alb.target_group_arn
  image_uri = var.image_uri
  lb_sg_id = module.alb.lb_sg_id
}

