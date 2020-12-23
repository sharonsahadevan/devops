
locals {
  dil_data_bucket            = "dil-demo-22323"
  dil_terraform_state_bucket = "dil-demo2-7262"
}


data "aws_iam_policy_document" "dil_data_bucket_policy" {
  statement {
    actions = [
      "s3:*",
    ]
    effect = "Deny"
    resources = [
      "arn:aws:s3:::${local.dil_data_bucket}",
    ]

    condition {
      test     = "StringNotLike"
      variable = "aws:SourceVpce"

      values = [
        "${module.vpc.vpc_endpoint_s3_id}",

      ]
    }
  }
}





module "dil_data_bucket" {
  source                  = "terraform-aws-modules/s3-bucket/aws"
  version                 = "1.17.0"
  bucket                  = local.dil_data_bucket
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
  force_destroy           = true
  policy                  = data.aws_iam_policy_document.dil_data_bucket_policy.json

  tags = {
    "Terraform"   = "true",
    "Environment" = "dev"

  }
}

module "dil_terraform_state_bucket" {
  source                  = "terraform-aws-modules/s3-bucket/aws"
  version                 = "1.17.0"
  bucket                  = "dil-s3-test-bucket-terraform"
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
  force_destroy           = true

  policy = data.aws_iam_policy_document.dil_data_bucket_policy.json

  tags = {
    "Terraform"   = "true",
    "Environment" = "dev"

  }
}



