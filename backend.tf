terraform {
  backend "s3" {
    bucket         = "vk-terraform-backend-2026"
    key            = "startup-company-project/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
  }
}