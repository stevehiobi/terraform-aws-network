variable "project" {
  default = "Test"
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
