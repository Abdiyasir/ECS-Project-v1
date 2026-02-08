module "ecr" {
  source               = "../modules/ecr"
  image_tag_mutability = "IMMUTABLE"
  repo_name            = var.repo_name
}

