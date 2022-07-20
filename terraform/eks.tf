

provider "kubernetes" {
    host = data.aws_eks_cluster.cluster.endpoint
    token = data.aws_eks_cluster_auth.cluster.token
     cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
}

# eks module information at: https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest
module "eks" {
    source = "terraform-aws-modules/eks/aws"
    version = "~> 18.0"
    cluster_name = local.cluster_name
    cluster_version = "1.22"
    subnets = module.vpc.public_subnets

    tags = {
        Name = "Friday-Lab-EKS-Cluster"
    }

    eks_managed_node_group_defaults = {
        instance_types = ["t2.micro"]
    }

    eks_managed_node_groups = {
        default_node_group = {
            disk_size = 8
        }
    }

    complete = {
        min_size     = 2
        max_size     = 2
        desired_size = 2
    }
}

data "aws_eks_cluster" "cluster" {
    name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
    name = module.eks.cluster_id
}
