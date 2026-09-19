provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "aws-vpc-terraform"
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }
}
