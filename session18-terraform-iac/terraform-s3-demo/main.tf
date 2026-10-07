resource "aws_s3_bucket" "demo_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = "Demo Bucket"
    Environment = var.environment
  }
}

resource "aws_s3_bucket_ownership_controls" "demo_bucket_acl_ownership" {
  bucket = aws_s3_bucket.demo_bucket.id
  rule {
    object_ownership = "ObjectWriter"
  }
}

resource "aws_s3_bucket_acl" "demo_bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.demo_bucket_acl_ownership]
  bucket     = aws_s3_bucket.demo_bucket.id
  acl        = "private"
}

resource "aws_s3_bucket_versioning" "demo_bucket_versioning" {
  bucket = aws_s3_bucket.demo_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
