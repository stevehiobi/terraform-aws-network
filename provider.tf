provider "aws" {
  region = var.aws_region
  # shared_credentials_file = "~/.aws/credentials"
  # profile                 = "default"
}

terraform {
  backend "s3" {
    bucket = "terraform-ntt-eks"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}