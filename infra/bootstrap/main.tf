module "ecr" {
  source               = "../modules/ecr"
  image_tag_mutability = "MUTABLE"
  repo_name            = var.repo_name
}

