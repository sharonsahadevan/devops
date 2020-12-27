module "iam_admin-group-with-assumable-roles-policy" {
  source          = "terraform-aws-modules/iam/aws//modules/iam-group-with-assumable-roles-policy"
  version         = "3.6.0"
  name            = "admin"
  group_users     = [module.iam_admin_user1.this_iam_user_name]
  assumable_roles = [module.iam_dev-assumable-roles.readonly_iam_role_arn]
}


module "iam_dev-group-with-assumable-roles-policy" {
  source          = "terraform-aws-modules/iam/aws//modules/iam-group-with-assumable-roles-policy"
  version         = "3.6.0"
  name            = "developer"
  group_users     = [module.iam_dev_user1.this_iam_user_name]
  assumable_roles = [module.iam_dev-assumable-roles.readonly_iam_role_arn]
}


module "iam_tester-group-with-assumable-roles-policy" {
  source          = "terraform-aws-modules/iam/aws//modules/iam-group-with-assumable-roles-policy"
  version         = "3.6.0"
  name            = "tester"
  group_users     = [module.iam_tester_user1.this_iam_user_name]
  assumable_roles = [module.iam_dev-assumable-roles.readonly_iam_role_arn]
}
