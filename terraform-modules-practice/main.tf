terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "dev_bucket" {
  source = "./modules/s3"

  bucket_name       = var.dev_bucket_name
  enable_versioning = true
}

module "qa_bucket" {
  source = "./modules/s3"

  bucket_name       = var.qa_bucket_name
  enable_versioning = true
}

module "prod_bucket" {
  source = "./modules/s3"

  bucket_name       = var.prod_bucket_name
  enable_versioning = true
}

output "dev_bucket_name" {
  value = module.dev_bucket.bucket_name
}

output "qa_bucket_name" {
  value = module.qa_bucket.bucket_name
}

output "prod_bucket_name" {
  value = module.prod_bucket.bucket_name
}