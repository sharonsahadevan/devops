provider "aws" {
  region = "eu-central-1"
}


module "nilesh" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "~> 3.0"

  name = "nilesh.test"

  create_iam_user_login_profile = true
  create_iam_access_key         = true
  force_destroy                 = true
  pgp_key                       = "keybase:test"
  password_reset_required       = true

}


module "alexey" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "~> 3.0"

  name = "alexey.test"

  create_iam_user_login_profile = true
  create_iam_access_key         = true
  force_destroy                 = true
  pgp_key                       = "keybase:test"
  password_reset_required       = true
}

module "sharon" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "~> 3.0"

  name = "sharon.test"

  create_iam_user_login_profile = true
  create_iam_access_key         = true
  force_destroy                 = true
  pgp_key                       = "keybase:test"
  password_reset_required       = true

}

module "sandeep" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "~> 3.0"

  name = "sandeep.test"

  create_iam_user_login_profile = true
  create_iam_access_key         = true
  force_destroy                 = true
  pgp_key                       = "keybase:test"
  password_reset_required       = true

}

module "rahul" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "~> 3.0"

  name = "rahul.test"

  create_iam_user_login_profile = true
  create_iam_access_key         = true
  force_destroy                 = true
  pgp_key                       = "keybase:test"
  password_reset_required       = true

}

module "iam_group_architect" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-group-with-policies"
  version = "~> 3.0"

  name = "architect"

  group_users = [
    module.nilesh.this_iam_user_name,

  ]

  custom_group_policy_arns = [
    "arn:aws:iam::aws:policy/AdministratorAccess",
  ]
}


module "iam_group_with_devops" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-group-with-policies"
  version = "~> 3.0"

  name = "devops"

  group_users = [
    module.alexey.this_iam_user_name
  ]

  custom_group_policy_arns = [
    "arn:aws:iam::aws:policy/AdministratorAccess",
  ]
}

module "iam_group_with_developers" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-group-with-policies"
  version = "~> 3.0"

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
      policy = data.aws_iam_policy_document.dev-custom-policy.json
    },
  ]
}

module "iam_group_with_testers" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-group-with-policies"
  version = "~> 3.0"

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
      policy = data.aws_iam_policy_document.tester-policy.json
    },
  ]
}

