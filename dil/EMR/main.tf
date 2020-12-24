provider "aws" {
	access_key = "AKIAT4V4PDOYWX7AGW7J"
	secret_key = "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"
	region = "us-west-2"
}

module "iam" {
  source = "./modules/iam"
}

module "security" {
  source              = "./modules/security"
  name                = var.name
  vpc_id              = var.vpc_id
  ingress_cidr_blocks = var.ingress_cidr_blocks
}

module "emr" {
  source                    = "./modules/emr"
  name                      = var.name
  release_label             = var.release_label
  applications              = var.applications
  subnet_id                 = var.subnet_id
  key_name                  = var.key_name
  master_instance_type      = var.master_instance_type
  master_ebs_size           = var.master_ebs_size
  core_instance_type        = var.core_instance_type
  core_instance_count       = var.core_instance_count
  core_ebs_size             = var.core_ebs_size
  emr_master_security_group = module.security.emr_master_security_group
  emr_slave_security_group  = module.security.emr_slave_security_group
  emr_ec2_instance_profile  = module.iam.emr_ec2_instance_profile
  emr_service_role          = module.iam.emr_service_role
  emr_autoscaling_role      = module.iam.emr_autoscaling_role
}
