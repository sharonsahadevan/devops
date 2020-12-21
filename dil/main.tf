provider "aws" {
  region = "eu-central-1"
}


module "vpc" {
  source = "./modules/vpc"

}

module "iam" {
  source = "./modules/iam"
}

module "ec2-instance" {
  source = "./modules/ec2-instance"
}
