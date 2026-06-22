# ---------------- S3 Bucket ----------------

resource "aws_s3_bucket" "project_bucket" {
  bucket = "vk-terraform-demo-bucket-2026"

  tags = {
    Name        = "Terraform Bucket"
    Environment = "Dev"
  }
}