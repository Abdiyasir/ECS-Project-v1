output "ecr_name" {
  description = "Name of ECR repo"
  value       = aws_ecr_repository.ecr
}

output "ecr_repo_uri" {
  description = "Repo URI"
  value       = aws_ecr_repository.ecr.repository_url
}