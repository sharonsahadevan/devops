provider "aws" {
  region = "eu-central-1"
}

# module "iam" {
#   source = "."
# }

# module "ec2" {
#   source = "."

# }

module "s3-bucket" {
  source = "./s3-bucket"

}


# locals {
#   bucket_id = modules.s3-bucket.this_s3_bucket_id
# }

output "this_s3_bucket_id" {

  value = module.s3-bucket.this_s3_bucket_id
}
