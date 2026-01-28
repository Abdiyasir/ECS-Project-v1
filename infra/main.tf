module "vpc" {
  source = "./Modules/vpc"
  vpc_cidr = var.vpc_cidr
  public-1_subnet = var.public-1_subnet
  public-2_subnet = var.public-2_subnet
  private-1_subnet = var.private-1_subnet
  private-2_subnet = var.private-2_subnet
  az-1 = var.az-1
  az-2 = var.az-2
  igw_cidr = var.igw_cidr
  ngw-1_cidr = var.ngw-1_cidr
  ngw-2_cidr = var.ngw-2_cidr
  }