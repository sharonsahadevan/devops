variable "account_id" {
  description = "account ID"
  type        = number
}

variable "region" {
  default     = "us-east-1"
  description = "AWS region"
}

variable "profile-dt" {
  type    = string
  default = "dt"

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



