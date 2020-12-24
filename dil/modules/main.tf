provider "aws" {
  region = "eu-central-1"
}

module "iam" {
  source = "./iam"
}

module "ec2" {
  source = "./ec2-instance"

}

module "s3-bucket" {
  source = "./s3-bucket"

}



