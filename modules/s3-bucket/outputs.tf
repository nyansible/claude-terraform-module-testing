# outputs.tf - Output values from the S3 bucket module
#
# Outputs are the module's "return values". They let the caller
# access information about what was created, which is useful for
# passing data between modules or displaying results.

output "bucket_id" {
  description = "The name/ID of the bucket."
  value       = aws_s3_bucket.this.id
}

output "bucket_arn" {
  description = "The ARN (Amazon Resource Name) of the bucket."
  value       = aws_s3_bucket.this.arn
}

output "bucket_domain_name" {
  description = "The bucket domain name (e.g., bucket-name.s3.amazonaws.com)."
  value       = aws_s3_bucket.this.bucket_domain_name
}
