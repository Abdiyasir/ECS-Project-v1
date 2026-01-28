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