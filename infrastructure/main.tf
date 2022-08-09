provider "aws" {
  region = "us-east-1"
}

# Set up an AWS-S3 bucket as a remote backend for this project
terraform {
  backend "s3" {
    bucket  = "cci-app-cinema-tf-state"
    key     = "app-cinema.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

# Local variables def
locals {
  prefix = "${var.prefix}-${terraform.workspace}"
  common_tags = {
    Environment = terraform.workspace
    Project     = var.project
    ManageBy    = "Terraform"
    Owner       = "Wil Henao"
  }
}

