# ---------------- S3 Backend Bucket ----------------

resource "aws_s3_bucket" "terraform_backend" {
  bucket = "vk-terraform-backend-2026"

  tags = {
    Name = "Terraform Backend"
  }
}

# ---------------- Bucket Versioning ----------------

resource "aws_s3_bucket_versioning" "backend_versioning" {
  bucket = aws_s3_bucket.terraform_backend.id

  versioning_configuration {
    status = "Enabled"
  }
}

# ---------------- DynamoDB Lock Table ----------------

resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform-lock-table"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "Terraform State Lock"
  }
}