module "iam_architect-group-with-assumable-roles-policy" {
  source          = "terraform-aws-modules/iam/aws//modules/iam-group-with-assumable-roles-policy"
  version         = "3.6.0"
  name            = "architect"
  group_users     = [module.iam_architect_user1.this_iam_user_name]
  assumable_roles = [module.iam_architect-assumable-roles.readonly_iam_role_arn]
}

module "iam_devops-group-with-assumable-roles-policy" {
  source          = "terraform-aws-modules/iam/aws//modules/iam-group-with-assumable-roles-policy"
  version         = "3.6.0"
  name            = "devops"
  group_users     = [module.iam_devops_user1.this_iam_user_name, module.iam_devops_user2.this_iam_user_name]
  assumable_roles = [module.iam_devops-assumable-roles.readonly_iam_role_arn]
}


module "iam_dev-group-with-assumable-roles-policy" {
  source          = "terraform-aws-modules/iam/aws//modules/iam-group-with-assumable-roles-policy"
  version         = "3.6.0"
  name            = "developer"
  group_users     = [module.iam_dev_user1.this_iam_user_name, module.iam_dev_user2.this_iam_user_name, module.iam_dev_user3.this_iam_user_name, module.iam_dev_user4.this_iam_user_name, module.iam_dev_user5.this_iam_user_name, module.iam_dev_user6.this_iam_user_name]
  assumable_roles = [module.iam_dev-assumable-roles.readonly_iam_role_arn]
}


module "iam_tester-group-with-assumable-roles-policy" {
  source          = "terraform-aws-modules/iam/aws//modules/iam-group-with-assumable-roles-policy"
  version         = "3.6.0"
  name            = "tester"
  group_users     = [module.iam_tester_user1.this_iam_user_name, module.iam_tester_user2.this_iam_user_name, module.iam_tester_user3.this_iam_user_name]
  assumable_roles = [module.iam_test-assumable-roles.readonly_iam_role_arn]
}
