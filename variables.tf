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
variable "availability_zones" {
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
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
  type    = map
  default = {}
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

variable "enable_flowlogs" {
  type    = bool
  default = false
}