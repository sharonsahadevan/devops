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
