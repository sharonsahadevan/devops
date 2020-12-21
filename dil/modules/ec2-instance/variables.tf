variable "instances_number" {
  description = "NUmber of instances"
  type        = number
  default     = 1
}

variable "instance_ami" {
  description = "AMI ID"
  type        = string
  default     = "ami-0e1ce3e0deb8896d2"
}
