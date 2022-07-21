

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
    vpc_id = module.vpc.vpc_id
    subnet_ids = module.vpc.public_subnets

    tags = {
        Name = "Friday-Lab-EKS-Cluster"
    }

    eks_managed_node_group_defaults = {
        instance_types = ["t2.medium"]

        desired_size = 2
        min_size     = 2
        max_size     = 2
    }

    eks_managed_node_groups = {
        default_node_group = {
        }
    }
}

data "aws_eks_cluster" "cluster" {
    name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
    name = module.eks.cluster_id
}
