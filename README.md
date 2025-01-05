# Terraform EKS Cluster on AWS

## Description
This Terraform configuration creates an EKS cluster on AWS with the following resources:
- A VPC with 2 public and 2 private subnets.
- An EKS cluster deployed in the private subnets.
- 2 worker nodes of type `m6a.large` in the private subnets.

## Prerequisites
1. **Install Terraform**: [Terraform Installation Guide](https://developer.hashicorp.com/terraform/downloads)
2. **AWS CLI**: [AWS CLI Installation](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
3. **AWS Credentials**: Configure your AWS credentials.
   ```bash
   aws configure
