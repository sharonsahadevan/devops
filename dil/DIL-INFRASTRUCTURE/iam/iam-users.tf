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

module "iam_devops_user2" {
  source                        = "terraform-aws-modules/iam/aws//modules/iam-user"
  version                       = "~> 3.0"
  name                          = "rohit"
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

module "iam_dev_user2" {
  source                        = "terraform-aws-modules/iam/aws//modules/iam-user"
  version                       = "~> 3.0"
  name                          = "maneesh"
  force_destroy                 = true
  create_iam_user_login_profile = false
}

module "iam_dev_user3" {
  source                        = "terraform-aws-modules/iam/aws//modules/iam-user"
  version                       = "~> 3.0"
  name                          = "manasi"
  force_destroy                 = true
  create_iam_user_login_profile = false
}

module "iam_dev_user4" {
  source                        = "terraform-aws-modules/iam/aws//modules/iam-user"
  version                       = "~> 3.0"
  name                          = "shrinath"
  force_destroy                 = true
  create_iam_user_login_profile = false
}

module "iam_dev_user5" {
  source                        = "terraform-aws-modules/iam/aws//modules/iam-user"
  version                       = "~> 3.0"
  name                          = "shweta"
  force_destroy                 = true
  create_iam_user_login_profile = false
}

module "iam_dev_user6" {
  source                        = "terraform-aws-modules/iam/aws//modules/iam-user"
  version                       = "~> 3.0"
  name                          = "ashwini"
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

module "iam_tester_user2" {
  source                        = "terraform-aws-modules/iam/aws//modules/iam-user"
  version                       = "~> 3.0"
  name                          = "sachin"
  force_destroy                 = true
  create_iam_user_login_profile = false
}

module "iam_tester_user3" {
  source                        = "terraform-aws-modules/iam/aws//modules/iam-user"
  version                       = "~> 3.0"
  name                          = "janu"
  force_destroy                 = true
  create_iam_user_login_profile = false

}
