provider "aws" {
  region = "eu-central-1"
}


module "vpc" {
  source = "./modules/vpc"

}

module "iam" {
  source = "./modules/iam/iam-user"
}
