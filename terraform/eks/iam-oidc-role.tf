# module "iam_iam-assumable-role-with-oidc" {
#   source                = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
#   version               = "3.6.0"
#   aws_account_id        = var.aws_account_id
#   role_name             = "iam-test-sa-role"
#   create_role           = true
#   force_detach_policies = true
#   provider_url          = module.eks.cluster_oidc_issuer_url
#   role_policy_arns      = ["arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"]
#}

module "alb_ingress_iam-assumable-role-with-oidc" {
  source                = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version               = "3.6.0"
  aws_account_id        = var.account_id
  role_name             = "alb-ingress-controller"
  create_role           = true
  force_detach_policies = true
  provider_url          = module.eks.cluster_oidc_issuer_url
  role_policy_arns      = [module.alb_iam_policy.arn]
}


# module "traefik_ingress_iam-assumable-role-with-oidc" {
#   source                = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
#   version               = "3.6.0"
#   aws_account_id        = var.aws_account_id
#   role_name             = "traefik-ingress-controller"
#   create_role           = true
#   force_detach_policies = true
#   provider_url          = module.eks.cluster_oidc_issuer_url
#   role_policy_arns      = ["arn:aws:iam::289714961096:policy/traefik-test-sa-policy"]
# }
