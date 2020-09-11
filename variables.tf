variable "project" {
  default = "eks-101"
}
variable "aws_region" {
  default = "us-east-1"
}
variable "environment" {
  default = "dev"
}
variable "tags" {
  type    = map
  default = {}
}
variable "availability_zones" {}
variable "vpc_cidr" {
  description = "VPC cidr block"
}

variable "subnet_cidrs_public" {
  description = "Public Subnet 1 cidr block"
}

variable "subnet_cidrs_private" {
  description = "Private cidr block"
}

variable "subnet_cidrs_mgmt" {
  description = "MGMT cidr block"
}

variable "vpc_tags" {
  type = map
}

variable "public_subnet_tags" {
  description = "Additional tags for the private subnets"
  type        = map(string)
  default     = {}
}

variable "private_subnet_tags" {
  description = "Additional tags for the private subnets"
  type        = map(string)
  default     = {}
}

variable "create_natgateways" {
  type    = bool
  default = false
}