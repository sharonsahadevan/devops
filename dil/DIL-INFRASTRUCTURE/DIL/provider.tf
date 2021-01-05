provider "aws" {
  profile = "dt"
  region  = var.region

}

#Set S3 backend for persisting TF state file remotely, ensure bucket already exits
# And that AWS user being used by TF has read/write perms
terraform {
  required_version = ">=0.12.0"
  required_providers {
    aws = ">=3.0.0"
  }
  backend "s3" {
    region  = "eu-central-1"
    profile = "dt"
    key     = "terraformstatefile"
    bucket  = "dil-dev-terraform-state"
  }
}
