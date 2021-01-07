variable "ingress_cidr_blocks" {
  description = "ingress cidr block"
  type        = list(string)
  default     = ["0.0.0.0/0"]


}

