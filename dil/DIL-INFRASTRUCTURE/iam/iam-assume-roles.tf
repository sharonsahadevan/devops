
module "iam_dev-assumable-roles" {
  source                     = "terraform-aws-modules/iam/aws//modules/iam-assumable-roles"
  version                    = "3.6.0"
  readonly_role_name         = "eks_dev"
  create_readonly_role       = true
  force_detach_policies      = true
  readonly_role_policy_arns  = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
  trusted_role_arns          = ["arn:aws:iam::${var.account_id}:root"]
  readonly_role_requires_mfa = false

}

module "iam_test-assumable-roles" {
  source                     = "terraform-aws-modules/iam/aws//modules/iam-assumable-roles"
  version                    = "3.6.0"
  readonly_role_name         = "eks_test"
  create_readonly_role       = true
  force_detach_policies      = true
  readonly_role_policy_arns  = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
  trusted_role_arns          = ["arn:aws:iam::${var.account_id}:root"]
  readonly_role_requires_mfa = false

}


module "iam_architect-assumable-roles" {
  source                     = "terraform-aws-modules/iam/aws//modules/iam-assumable-roles"
  version                    = "3.6.0"
  readonly_role_name         = "eks_architect"
  create_readonly_role       = true
  force_detach_policies      = true
  readonly_role_policy_arns  = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
  trusted_role_arns          = ["arn:aws:iam::${var.account_id}:root"]
  readonly_role_requires_mfa = false

}


module "iam_devops-assumable-roles" {
  source                     = "terraform-aws-modules/iam/aws//modules/iam-assumable-roles"
  version                    = "3.6.0"
  readonly_role_name         = "eks_devops"
  create_readonly_role       = true
  force_detach_policies      = true
  readonly_role_policy_arns  = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
  trusted_role_arns          = ["arn:aws:iam::${var.account_id}:root"]
  readonly_role_requires_mfa = false

}


