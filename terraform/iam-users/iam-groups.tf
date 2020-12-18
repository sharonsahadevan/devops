terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Define groups

resource "aws_iam_group" "Developer" {
  name = "Developer"

}

resource "aws_iam_group" "Architect" {
  name = "Architect"

}

resource "aws_iam_group" "Admin" {
  name = "Admin"

}

resource "aws_iam_group" "Devops" {
  name = "Devops"

}
