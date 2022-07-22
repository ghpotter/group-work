/*
  Terraform files by Tristan S and Gregory P
*/

/*
creditials saved in terraform-provider.tf and ignored in github
*/

# provider "aws" {
# region = var.aws_region
# access_key = "Put Access Key Here"
# secret_key = "Put Secret Key Here"
# }
provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  token                  = data.aws_eks_cluster_auth.cluster.token
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
}

variable "labname" {
  type = string
  default = "friday-lab-test"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}