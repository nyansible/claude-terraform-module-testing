# variables.tf - Root module variables
#
# These are the top-level inputs for the whole configuration.
# You set these via a .tfvars file, CLI flags, or environment variables.

variable "aws_region" {
  description = "The AWS region to deploy into."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "A name prefix for all resources."
  type        = string
  default     = "my-project"
}

variable "environment" {
  description = "The deployment environment."
  type        = string
  default     = "dev"
}
