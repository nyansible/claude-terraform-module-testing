# main.tf - Resource definitions for the S3 bucket module
#
# This is where the actual infrastructure is defined.
# Notice how resources reference var.<name> to use the input variables.

resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  # merge() combines the default tags with any extra tags passed in
  tags = merge(
    {
      Name        = var.bucket_name
      Environment = var.environment
      ManagedBy   = "terraform"
    },
    var.tags
  )
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    # Conditionally enable versioning based on the input variable
    status = var.enable_versioning ? "Enabled" : "Suspended"
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  # Block all public access by default - a security best practice
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
