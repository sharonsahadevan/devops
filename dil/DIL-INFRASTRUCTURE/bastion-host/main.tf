
locals {
  user_data = <<EOF
#!/bin/bash
sudo apt-get update && sudo apt-get install -y apt-transport-https gnupg2 curl unzip && \

sudo curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" && \

sudo chmod +x ./kubectl && \ 

sudo mv ./kubectl /usr/local/bin/kubectl && \

sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
sudo unzip awscliv2.zip && \
sudo ./aws/install && \

sudo curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | sudo tar xz -C /tmp && \
sudo mv /tmp/eksctl /usr/local/bin && \

sudo curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - && \
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
sudo apt-get update && sudo apt-get install terraform && \

sudo curl -sSL https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash


EOF
}

module "bastion_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 3.0"

  name        = "dil-bastion-dev-sg"
  description = "Security group for DIL dev bastion instance"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = var.ingress_cidr_blocks
  ingress_rules       = var.ingress_rules
  egress_rules        = var.egress_rules
}





module "ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.12.0"

  name           = "dil-bastion-dev"
  instance_count = 1

  ami                         = var.instance_ami
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [module.bastion_security_group.this_security_group_id]
  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  key_name                    = var.key_name
  user_data_base64            = base64encode(local.user_data)
  #iam_instance_profile        = aws_iam_instance_profile.bastion_host_instance_profile.name
  iam_instance_profile = module.iam_iam-assumable-role.this_iam_instance_profile_name

  root_block_device = [
    {
      volume_type = "gp2"
      volume_size = 20
    },
  ]


  ebs_block_device = [
    {
      device_name = "/dev/sdf"
      volume_type = "gp2"
      volume_size = 50
      encrypted   = false

    }
  ]


  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_eip" "ip" {
  vpc      = true
  instance = module.ec2.id[0]
}
