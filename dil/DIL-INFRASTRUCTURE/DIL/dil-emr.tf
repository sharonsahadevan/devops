# terraform {
#   required_version = "~> 0.12.12"
# }

# provider "aws" {
#   region  = "eu-central-1"
#   profile = "dt"
# }

module "iam" {
  source = "./modules/iam"
}

# module "security" {
#   source = "./modules/security"

# }

module "emr" {
  source      = "SebastianUA/emr/aws"
  name        = "TEST2"
  environment = "development"

  # EMR security
  enable_emr_security_configuration = false
  emr_security_configuration_name   = "emr-security-config"
  #emr_security_configuration_configuration = file("./additional_files/erm-security-config.json")

  # EMR cluster
  enable_emr_cluster        = true
  emr_cluster_name          = "dil_dev_emr"
  emr_cluster_release_label = "emr-5.32.0"
  emr_cluster_service_role  = module.iam.emr_service_role

  #emr_cluster_applications = ["Spark", "Presto", "Spark"]
  emr_cluster_applications = ["Spark", "ZooKeeper", "Hive", "Hadoop", "HBase"]
  #emr_cluster_additional_info                   = file("./additional_files/emr-cluster-additional_info.json")
  emr_cluster_termination_protection            = false
  emr_cluster_keep_job_flow_alive_when_no_steps = true
  emr_cluster_ebs_root_volume_size              = 30
  #emr_cluster_configurations_json               = file("./additional_files/emr-cluster-configurations_json.json")
  #emr_cluster_autoscaling_role                  = "arn:aws:iam::167127734783:role/emr-service-role"

  emr_cluster_ec2_attributes = [{
    # If you want to use public subnet. Tested! :
    # subnet_id                           = "subnet-32xfzfds4"
    # emr_managed_master_security_group   = "sg-8980fd9sfdsf"
    # emr_managed_slave_security_group    = "sg-8980fd9sfdsf"
    # instance_profile                    = "arn:aws:iam::167127734783:instance-profile/emr-service-role"
    # You cannot specify a ServiceAccessSecurityGroup for a cluster launched in public subnet
    # If you want to use private subnet:

    subnet_id                         = module.vpc.private_subnets[0]
    key_name                          = var.emr_key_name
    instance_profile                  = module.iam.emr_ec2_instance_profile
    emr_managed_master_security_group = aws_security_group.emr_master.id
    emr_managed_slave_security_group  = aws_security_group.emr_slave.id
    service_access_security_group     = aws_security_group.emr_service_access_security_group.id

  }]

  emr_cluster_master_instance_group_ebs_config = [{
    instance_type  = "m5.xlarge"
    instance_count = 1

    ebs_config_size                 = 10
    ebs_config_type                 = "gp2"
    ebs_config_volumes_per_instance = 1
  }]

  emr_cluster_core_instance_group_ebs_config = [{
    instance_type  = "c4.large"
    instance_count = 1
    # bid_price                       = "1.30"
    #autoscaling_policy = file("./additional_files/emr-cluster-core_instance_group-autoscaling_policy.json")

    ebs_config_size                 = 10
    ebs_config_type                 = "gp2"
    ebs_config_volumes_per_instance = 1
  }]



  # EMR instance group
  enable_emr_instance_group         = true
  emr_instance_group_name           = "emr-instance-group"
  emr_instance_group_instance_type  = "m5.xlarge"
  emr_instance_group_instance_count = 1
  emr_instance_group_ebs_config = [{
    size                 = 10
    type                 = "gp2"
    volumes_per_instance = 1
  }]

  #emr_instance_group_autoscaling_policy  = file("./additional_files/emr-cluster-core_instance_group-autoscaling_policy.json")
  emr_instance_group_configurations_json = null


  tags = map(
    "Environment", "dev",
    "Terraform", "true",
  )
}
