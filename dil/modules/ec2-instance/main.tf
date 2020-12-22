
module "ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.12.0"

  name           = "dil-bastion-dev"
  instance_count = 1

  ami                         = var.instance_ami
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [module.vpc.default_security_group_id]
  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  key_name                    = var.key_name

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

resource "aws_eip" "this" {
  vpc      = true
  instance = module.ec2.id[0]
}
