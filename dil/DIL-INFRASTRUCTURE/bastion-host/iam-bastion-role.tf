data "template_file" "bastion_iam_policy_template" {
  template = file("bastion-host-policy-template.json.tpl")
}

module "bastion_iam_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "3.6.0"
  name    = "DIL_DEV_BASTION_POLICY"
  policy  = data.template_file.bastion_iam_policy_template.rendered
}

module "iam_iam-assumable-role" {
  source                  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version                 = "3.6.0"
  role_name               = "dil_bastion"
  create_role             = true
  force_detach_policies   = true
  custom_role_policy_arns = [module.bastion_iam_policy.arn]
  trusted_role_arns       = ["arn:aws:iam::${var.account_id}:root"]
  role_requires_mfa       = true
  create_instance_profile = true
  mfa_age                 = 3600
}
