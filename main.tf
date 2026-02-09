# main.tf - Root module
#
# This is the entry point. It configures the AWS provider and
# calls our reusable S3 bucket module with specific values.

terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# --- Module Calls ---
# Each "module" block creates an instance of our reusable module.
# The "source" tells Terraform where to find the module code.
# Everything else maps to the module's input variables.

module "app_bucket" {
  source = "./modules/s3-bucket"

  bucket_name       = "${var.project_name}-app-${var.environment}"
  environment       = var.environment
  enable_versioning = true

  tags = {
    Purpose = "Application assets"
  }
}

module "logs_bucket" {
  source = "./modules/s3-bucket"

  bucket_name       = "${var.project_name}-logs-${var.environment}"
  environment       = var.environment
  enable_versioning = false

  tags = {
    Purpose = "Application logs"
  }
}
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "6.6.0"

  name = "test-vpc"
  cidr = "10.0.0.0/16"

  azs = ["us-west-1a", "us-west-1b"]
  public_subnets = ["10.0.1.0/24","10.0.2.0/24"]
  private_subnets = ["10.0.10.0/24", "10.0.20.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true
}
module "ec2" {
  source = "./modules/ec2-instance"
  security_group_ids = ["sg-349434"]
  subnet_id = module.vpc.public_subnets[1]
}