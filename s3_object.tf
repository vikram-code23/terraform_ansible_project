#------------- S3 OBJECT ----------------

resource "aws_s3_object" "sample_file" {
  bucket = aws_s3_bucket.project_bucket.id

  key    = "sample.txt"
  content = "Hello from Terraform S3!"
  content_type = "text/plain"
}
