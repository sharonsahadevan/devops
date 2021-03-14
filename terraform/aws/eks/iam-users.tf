############################
# Architects
############################

module "iam_architect_user1" {
  source                        = "terraform-aws-modules/iam/aws//modules/iam-user"
  version                       = "~> 3.0"
  name                          = "alexey"
  force_destroy                 = true
  create_iam_user_login_profile = false
}

############################
# Devops
############################

module "iam_devops_user1" {
  source                        = "terraform-aws-modules/iam/aws//modules/iam-user"
  version                       = "~> 3.0"
  name                          = "nikhill"
  force_destroy                 = true
  create_iam_user_login_profile = false
}


############################
# Devlopers
############################

module "iam_dev_user1" {
  source                        = "terraform-aws-modules/iam/aws//modules/iam-user"
  version                       = "~> 3.0"
  name                          = "vikram"
  force_destroy                 = true
  create_iam_user_login_profile = false
}


############################
# Testers
############################

module "iam_tester_user1" {
  source                        = "terraform-aws-modules/iam/aws//modules/iam-user"
  version                       = "~> 3.0"
  name                          = "vlad"
  force_destroy                 = true
  create_iam_user_login_profile = false
}

