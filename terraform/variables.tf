variable "aws_region" {
  description = "AWS region where the VPC will be deployed."
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name."
  type        = string
  default     = "dev"
}
