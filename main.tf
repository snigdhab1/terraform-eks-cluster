provider "aws" {
  region = "us-east-1" # Replace with your preferred AWS region
}

# Create a VPC using a Terraform module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  name = "eks-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]

  enable_nat_gateway = true
}

# Create an EKS cluster using a Terraform module
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "19.15.0"

  cluster_name    = "eks-cluster"
  cluster_version = "1.26"

  subnets         = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id

  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 2
      min_capacity     = 2

      instance_type = "m6a.large"
      key_name      = var.key_name # SSH key name
    }
  }
}

# Output key resources
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "eks_cluster_name" {
  value = module.eks.cluster_id
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "eks_cluster_kubeconfig" {
  value = module.eks.kubeconfig
}

output "node_group_arns" {
  value = module.eks.node_group_arns
}
