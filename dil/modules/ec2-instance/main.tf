module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.12.0"

  name           = "dil-bastion-dev"
  instance_count = 1

  ami                         = var.instance_ami
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [module.vpc.default_security_group_id]
  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  root_block_device           = { volume_type = "gp2", volume_size = 25 }
  ebs_block_device = [
    {
      device_name = "/dev/sdf"
      volume_type = "gp2"
      volume_size = 50
      encrypted   = false

    }
  ]
  key_name = module.key-pair.this_key_pair_key_name

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_volume_attachment" "this_ec2" {
  count = var.instances_number

  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.this[count.index].id
  instance_id = module.ec2.id[count.index]
}

resource "aws_ebs_volume" "this" {
  count = var.instances_number

  availability_zone = module.ec2.availability_zone[count.index]
  size              = 1
}


module "key-pair" {
  source   = "terraform-aws-modules/key-pair/aws"
  version  = "0.6.0"
  key_name = "dil-bastion-key-dev"
}
