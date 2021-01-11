variable "account_id" {
  description = "account ID"
  type        = number
}

variable "region" {
  default     = "eu-central-1"
  description = "AWS region"
}

variable "profile-dt" {
  type    = string
  default = "dt"

}


variable "dil_data_bucket" {
  type    = string
  default = "dil-dev-data-bucket"
}

########################################
#Bastion Host
########################################
variable "instances_number" {
  description = "Number of instances"
  type        = number
  default     = 1
}

variable "instance_ami" {
  description = "AMI ID"
  type        = string
  default     = "ami-0e1ce3e0deb8896d2"
}

variable "key_name" {
  description = "key name"
  type        = string
  default     = "dil-dev-bastion"
}

variable "ingress_cidr_blocks" {
  description = "ingress cidr block"
  type        = list(string)
  default     = ["0.0.0.0/0"]


}

variable "ingress_rules" {
  description = "ingress rules"
  type        = list(string)
  default     = ["http-80-tcp", "all-icmp", "ssh-tcp"]


}

variable "egress_rules" {
  description = "ingress egress rules"
  type        = list(string)
  default     = ["all-all"]


}

variable "instance_profile_name" {
  description = "Instance profile name"
  type        = string
  default     = ""

}

variable "profile" {
  type    = string
  default = "dt"

}


#####################################
# EMR
#####################################

variable "emr_key_name" {
  type    = string
  default = "dil-dev-emr-pair"

}
