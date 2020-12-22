provider "aws" {
  region = "eu-central-1"
}

module "s3-bucket" {
  source              = "terraform-aws-modules/s3-bucket/aws"
  version             = "1.17.0"
  bucket              = "dil-test-bucket"
  block_public_policy = true
  force_destroy       = true
  tags = {
    "Terraform"   = "true",
    "Environment" = "dev"

  }
}

