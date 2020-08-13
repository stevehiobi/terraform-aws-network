provider "aws" {
  region = var.region
  # shared_credentials_file = "~/.aws/credentials"
  # profile                 = "development"
}

terraform {
  backend "s3" {
    bucket = "terraform-bucket-infra"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

module "aws-network" {
  source = "../../aws-network"

  project     = var.project
  environment = var.environment

  availability_zones   = ["us-east-1a", "us-east-1b", "us-east-1c"]
  vpc_cidr             = "10.0.0.0/16"
  subnet_cidrs_public  = ["10.0.96.0/20", "10.0.112.0/20", "10.0.128.0/20"]
  subnet_cidrs_private = ["10.0.0.0/19", "10.0.32.0/19", "10.0.64.0/19"]
  subnet_cidrs_mgmt    = ["10.0.144.0/20", "10.0.160.0/20", "10.0.176.0/20"]

  create_natgateways = false

  tags = {
    environment = var.environment
    project     = var.project
  }

  vpc_tags = {}

  public_subnet_tags = {}

  private_subnet_tags = {}

}