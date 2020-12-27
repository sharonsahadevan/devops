module "iam_admin_user1" {
  source        = "terraform-aws-modules/iam/aws//modules/iam-user"
  version       = "~> 3.0"
  name          = "nilesh"
  force_destroy = true
  pgp_key       = "keybase:nilesh"
}

module "iam_dev_user1" {
  source        = "terraform-aws-modules/iam/aws//modules/iam-user"
  version       = "~> 3.0"
  name          = "sandeep"
  force_destroy = true
  pgp_key       = "keybase:sandeep"
}

module "iam_tester_user1" {
  source        = "terraform-aws-modules/iam/aws//modules/iam-user"
  version       = "~> 3.0"
  name          = "rahul"
  force_destroy = true
  pgp_key       = "keybase:rahul"
}
