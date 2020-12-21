provider "aws" {
  region = "eu-central-1"
}


module "iam_user1" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "~> 3.0"

  name = "nilesh.test"

  create_iam_user_login_profile = true
  create_iam_access_key         = true
  force_destroy                 = true
  pgp_key                       = "keybase:test"
  password_reset_required       = true

}


module "iam_user2" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "~> 3.0"

  name = "alexey.test"

  create_iam_user_login_profile = false
  create_iam_access_key         = true
}


module "iam_group_architects" {
  source  = "terraform-aws-modules/iam/aws//examples/iam-group-with-policies"
  version = "3.6.0"

  name = "architect"

  group_users = [
    module.iam_user1.this_iam_user_name,

  ]

  custom_group_policy_arns = [
    "arn:aws:iam::aws:policy/AdministratorAccess",
  ]
}


module "iam_group_devops" {
  source  = "terraform-aws-modules/iam/aws//examples/iam-group-with-policies"
  version = "3.6.0"

  name = "devops"

  group_users = [
    module.iam_user2.this_iam_user_name,
  ]

  custom_group_policy_arns = [
    "arn:aws:iam::aws:policy/AdministratorAccess",
  ]
}

module "iam_group_developers" {
  source  = "terraform-aws-modules/iam/aws//examples/iam-group-with-policies"
  version = "3.6.0"

  name = "developers"

  group_users = [

  ]

  # Need to be updated
  custom_group_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess",
  ]

  custom_group_policies = [
    {
      name   = "AllowS3Listing"
      policy = data.aws_iam_policy_document.sample.json
    },
  ]
}

module "iam_group_testers" {
  source  = "terraform-aws-modules/iam/aws//examples/iam-group-with-policies"
  version = "3.6.0"

  name = "testers"

  group_users = [

  ]

  # Need to be updated

  custom_group_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess",
  ]

  custom_group_policies = [
    {
      name   = "AllowS3Listing"
      policy = data.aws_iam_policy_document.sample.json
    },
  ]
}

data "aws_iam_policy_document" "developer" {
  statement {
    actions = [
      "s3:ListBuckets",
    ]

    resources = ["*"]
  }
}



data "aws_iam_policy_document" "tester" {
  statement {
    actions = [
      "s3:ListBuckets",
    ]

    resources = ["*"]
  }
}
