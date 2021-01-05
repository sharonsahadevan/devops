
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = local.cluster_name
  cluster_version = "1.17"
  subnets         = module.vpc.private_subnets
  enable_irsa     = true
  map_roles = [
    {
      rolearn  = module.iam_dev-assumable-roles.readonly_iam_role_arn
      username = module.iam_dev-assumable-roles.readonly_iam_role_name
      groups   = []
    },
    {
      rolearn  = module.iam_test-assumable-roles.readonly_iam_role_arn
      username = module.iam_test-assumable-roles.readonly_iam_role_name
      groups   = []
    },
    {
      rolearn  = module.iam_architect-assumable-roles.readonly_iam_role_arn
      username = module.iam_architect-assumable-roles.readonly_iam_role_name
      groups   = []

    },
    {
      rolearn  = module.iam_devops-assumable-roles.readonly_iam_role_arn
      username = module.iam_devops-assumable-roles.readonly_iam_role_name
      groups   = ["system:masters"]
    },
  ]
  tags = {
    Environment = "development"
  }

  vpc_id = module.vpc.vpc_id

  worker_groups = [
    {
      name                          = "worker-group-1"
      instance_type                 = "t2.micro"
      asg_desired_capacity          = 1
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
    },
    {
      name                          = "worker-group-2"
      instance_type                 = "t2.micro"
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_two.id]
      asg_desired_capacity          = 1
    },
  ]
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}
