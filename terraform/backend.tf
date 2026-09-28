terraform {
  backend "s3" {
    bucket       = "aws-vpc-terraform-state-karthick-dev"
    key          = "dev/vpc/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
