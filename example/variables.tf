variable "project" {
  default = "eks-101"
}
variable "region" {
  default = "us-east-1"
}
variable "environment" {
  default = "dev"
}

variable "tags" {
  type    = map
  default = {}
}
