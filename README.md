# Terraform VPC and EKS Infrastructure

This repository provisions a complete AWS infrastructure using Terraform, including a Virtual Private Cloud (VPC) and an Amazon EKS cluster with a managed node group.

---

## Architecture Overview

The infrastructure includes:

### VPC
- Custom VPC
- Public and private subnets across multiple Availability Zones
- Internet Gateway
- NAT Gateway with Elastic IP
- Public and private route tables and associations

### EKS
- EKS cluster
- IAM role for the EKS control plane
- Managed node group
- Configurable Kubernetes version and autoscaling settings

---

## Prerequisites

- Terraform >= 1.5
- AWS CLI installed and configured
- AWS credentials with sufficient permissions
- An AWS account

---

## Project Structure

```text
.
├── main.tf
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── vpc/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
└── eks/
    ├── main.tf
    └── variables.tf

# Example terraform.auto.tfvars file
vpc_name             = "my-vpc"
cidr_block           = "10.0.0.0/16"

public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]

availability_zones   = ["us-west-2a", "us-west-2b"]

igw                  = "my-igw"
eip                  = "my-elastic-ip"
nat_gateway          = "my-nat-gateway"

public_route_cidr    = "0.0.0.0/0"
private_route_cidr   = "0.0.0.0/0"

cluster_name         = "my-eks-cluster"
cluster_role_name    = "ClusterIamrole"
eks_version          = "1.31"

node_group_name      = "eks-node-group"
node_role_name       = "NodeIamrole"
instance_types       = ["t2.large"]

desired_size         = 1
min_size             = 1
max_size             = 3

#Input Variables

| Variable             | Description                         |
| -------------------- | ----------------------------------- |
| vpc_name             | Name of the VPC                     |
| cidr_block           | CIDR block for the VPC              |
| public_subnet_cidrs  | CIDR blocks for public subnets      |
| private_subnet_cidrs | CIDR blocks for private subnets     |
| availability_zones   | Availability Zones for subnets      |
| igw                  | Internet Gateway name               |
| eip                  | Elastic IP for NAT Gateway          |
| nat_gateway          | NAT Gateway name                    |
| public_route_cidr    | Public route CIDR                   |
| private_route_cidr   | Private route CIDR                  |
| cluster_name         | EKS cluster name                    |
| cluster_role_name    | IAM role name for EKS cluster       |
| eks_version          | Kubernetes version                  |
| node_group_name      | EKS node group name                 |
| node_role_name       | IAM role name for worker nodes      |
| instance_types       | EC2 instance types for worker nodes |
| desired_size         | Desired number of nodes             |
| min_size             | Minimum node count                  |
| max_size             | Maximum node count                  |

# Root main.tf

# The root main.tf wires the modules together:

module "vpc" {
  source               = "./vpc"
  vpc_name             = var.vpc_name
  cidr_block           = var.cidr_block
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  igw                  = var.igw
  public_route_cidr    = var.public_route_cidr
  private_route_cidr   = var.private_route_cidr
  eip                  = var.eip
  nat_gateway          = var.nat_gateway
}

module "eks" {
  source            = "./eks"
  vpc_id            = module.vpc.vpc_id
  subnet_ids        = module.vpc.private_subnet_ids
  cluster_name      = var.cluster_name
  eks_version       = var.eks_version
  node_role_name    = var.node_role_name
  cluster_role_name = var.cluster_role_name
  node_group_name   = var.node_group_name
  instance_types    = var.instance_types
  desired_size      = var.desired_size
  max_size          = var.max_size
  min_size          = var.min_size

  depends_on        = [module.vpc]
}
