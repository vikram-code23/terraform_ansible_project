resource "aws_s3_bucket" "project_bucket" {
  bucket = "vk-terraform-demo-bucket-2026"

  force_destroy = true

  tags = {
    Name        = "Terraform Bucket"
    Environment = "Dev"
  }
}