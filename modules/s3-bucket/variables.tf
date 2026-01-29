# variables.tf - Input variables for the S3 bucket module
#
# Variables are the module's "parameters". Anyone calling this module
# must (or can) provide values for these. Think of them like function arguments.

variable "bucket_name" {
  description = "The name of the S3 bucket. Must be globally unique across all AWS accounts."
  type        = string

  validation {
    condition     = length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63
    error_message = "Bucket name must be between 3 and 63 characters."
  }
}

variable "environment" {
  description = "The deployment environment (e.g., dev, staging, prod)."
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: dev, staging, prod."
  }
}

variable "enable_versioning" {
  description = "Whether to enable versioning on the bucket. Versioning keeps a history of all object changes."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Additional tags to apply to the bucket."
  type        = map(string)
  default     = {}
}
