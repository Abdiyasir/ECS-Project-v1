variable "vpc_cidr" {
  type        = string
  description = "vpc CIDR block"

}

variable "public-1_subnet" {
  type        = string
  description = "Public 1 subnet CIDR block"

}

variable "public-2_subnet" {
  type        = string
  description = "Public 2 subnet CIDR block"

}

variable "az-1" {
  type        = string
  description = "First availability zone"

}

variable "az-2" {
  type        = string
  description = "Second availability zone"

}

variable "private-1_subnet" {
  type        = string
  description = "Private 1 subnet CIDR block"

}

variable "private-2_subnet" {
  type        = string
  description = "Private 2 subnet CIDR block"

}

variable "igw_cidr" {
  type        = string
  description = "Internet gateway CIDR block"

}

variable "ngw-1_cidr" {
  type        = string
  description = "First Nat gateway CIDR block"
}

variable "ngw-2_cidr" {
  type        = string
  description = "First Nat gateway CIDR block"
}

variable "domain_name" {
  type        = string
  description = "Domain name"
}

variable "certificate_arn" {
  type        = string
  description = "ARN for ACM certificate"
}

variable "repo_name" {
  type        = string
  description = "Name of ECR repo"

}

variable "image_tag_mutability" {
  type        = string
  description = "Image mutability"

}

variable "ecs_family" {
  type        = string
  description = "ECS family name "

}


variable "image_uri" {
  type        = string
  description = "Docker image URI"

}

variable "container_name" {
  type        = string
  description = "Name of ECS container"

}
variable "task_count" {
  type        = string
  description = "Numer of ECS tasks"

}

variable "container_port" {
  type        = string
  description = "Numer of ECS tasks"

}