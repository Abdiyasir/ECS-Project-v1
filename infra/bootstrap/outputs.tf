output "ecr_name" {
  description = "Name of ECR repo"
  value       = module.ecr.ecr_name
}

output "ecr_repo_uri" {
  description = "Repo URI"
  value       = module.ecr.ecr_repo_uri
}