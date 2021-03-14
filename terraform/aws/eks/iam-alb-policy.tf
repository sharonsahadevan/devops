data "template_file" "alb_iam_policy_template" {
  template = file("./policy-templates/alb-iam-policy-template.json.tpl")
}

module "alb_iam_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "3.6.0"
  name    = "DIL_AWS_ALB_INGRESS_POLICY"
  policy  = data.template_file.alb_iam_policy_template.rendered
}
