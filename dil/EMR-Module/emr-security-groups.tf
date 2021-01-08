resource "aws_security_group" "emr_master" {
  name                   = "emr-master-sg"
  description            = "Security group for EMR master."
  vpc_id                 = module.vpc.vpc_id
  revoke_rules_on_delete = true

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 4040
    to_port     = 4040
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8888
    to_port     = 8888
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 20888
    to_port     = 20888
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "EMR_master"
  }
}

resource "aws_security_group" "emr_slave" {
  name                   = "emr-slave-sg"
  description            = "Security group for EMR slave."
  vpc_id                 = module.vpc.vpc_id
  revoke_rules_on_delete = true

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "EMR_slave"
  }
}

resource "aws_security_group" "emr_service_access_security_group" {
  name                   = "emr-service-access-sg"
  description            = "Security group for EMR slave."
  vpc_id                 = module.vpc.vpc_id
  revoke_rules_on_delete = true

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9443
    to_port     = 9443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port   = 8443
    to_port     = 8443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "EMR_slave"
  }
}

resource "aws_security_group_rule" "allow_tcp_from_master_to_service" {
  type                     = "ingress"
  from_port                = 9443
  to_port                  = 9443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.emr_service_access_security_group.id
  source_security_group_id = aws_security_group.emr_master.id
}

# resource "aws_security_group_rule" "emr_master_sg_rule" {
#   type      = "egress"
#   from_port = 0
#   to_port   = 9443
#   protocol  = "tcp"
#   #cidr_blocks              = ["0.0.0.0/0"]
#   security_group_id        = aws_security_group.emr_master.id
#   source_security_group_id = aws_security_group.emr_service_access_security_group.id
# }


