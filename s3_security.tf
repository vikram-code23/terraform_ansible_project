#------------------- VERSIONING -----------------------------

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.project_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}


#------------------- ENCRYPTION -------------------------------

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encryption" {
  bucket = aws_s3_bucket.project_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}


#------------------ BLOCK PUBLIC ACCESS -----------------

resource "aws_s3_bucket_public_access_block" "bucket_block_public" {
  bucket = aws_s3_bucket.project_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}