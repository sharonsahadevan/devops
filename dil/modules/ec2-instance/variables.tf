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
  default     = "test"
}
