variable "account_id" {
  description = "account ID"
  type        = number
}

variable "admin_user1" {
  type = string


}

variable "dev_user1" {
  type = string

}


variable "test_user1" {
  type = string

}

variable "region" {
  default     = "eu-central-1"
  description = "AWS region"
}

variable "region-dt" {
  type    = string
  default = "eu-central-1"

}

variable "profile-dt" {
  type    = string
  default = "dt"

}
