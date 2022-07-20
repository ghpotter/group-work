//
// Tristan S
//
// Lab 3 Friday
//
//

# creditials saved in terraform-provider.tf
# and ignored in github
#
# provider "aws" {
# region = var.aws_region
# access_key = "Put Access Key Here"
# secret_key = "Put Secret Key Here"
# }

variable "labname" {
  type = string
  default = "friday-lab-test"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}