variable "public-1_subnet" {
  type        = string
  description = "Public 1 subnet CIDR block"

}

variable "public-2_subnet" {
  type        = string
  description = "Public 2 subnet CIDR block"

}

variable "vpc_cidr" {
  type        = string
  description = "vpc CIDR block"

}

variable "vpc_id" {
  type        = string
  description = "vpc ID"
}

variable "certificate_arn" {
  type        = string
  description = "ARN for ACM certificate"
}
