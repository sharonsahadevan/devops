module "s3-private-bucket" {
  source        = "terraform-aws-modules/s3-bucket/aws"
  bucket        = "eks-emr-demo"
  acl           = "private"
  force_destroy = true

  versioning = {
    enabled = true
  }

  tags = {
    Name        = "eks-emr-demo"
    Environment = local.Environment
  }
}



