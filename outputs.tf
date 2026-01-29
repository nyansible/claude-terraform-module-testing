# outputs.tf - Root module outputs
#
# These surface values from our module instances so you can
# see them after running "terraform apply", or use them in
# other configurations.

output "app_bucket_id" {
  description = "The ID of the application bucket."
  value       = module.app_bucket.bucket_id
}

output "app_bucket_arn" {
  description = "The ARN of the application bucket."
  value       = module.app_bucket.bucket_arn
}

output "logs_bucket_id" {
  description = "The ID of the logs bucket."
  value       = module.logs_bucket.bucket_id
}

output "logs_bucket_arn" {
  description = "The ARN of the logs bucket."
  value       = module.logs_bucket.bucket_arn
}
