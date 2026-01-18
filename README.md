# Terraform Module: VPC + EKS

This Terraform module provisions a **networking layer (VPC)** and an **Amazon EKS cluster** with managed nodes. The **VPC module** handles all networking resources, while the **EKS module** creates the cluster, managed node groups, and IAM roles.  

This setup allows you to deploy a production-ready Kubernetes cluster with private subnets and secure networking.

---

## Features

### VPC Module
- Creates a **VPC** with a configurable CIDR block
- Creates **public and private subnets**
- Creates an **Internet Gateway (IGW)**
- Allocates an **Elastic IP (EIP)** for NAT Gateway
- Creates a **NAT Gateway** for private subnets
- Creates **route tables** and associates them with subnets

### EKS Module
- Provisions an **Amazon EKS cluster**
- Creates **managed node groups** with configurable scaling
- Sets up **IAM roles** for the cluster and nodes
- Allows **private endpoint access** to the cluster
- Requires **VPC ID and subnet IDs** from the VPC module

---

## Usage

### Example: Deploy VPC + EKS

```hcl
# VPC Module
module "vpc" {
  source  = "./modules/vpc"
  vpc_name = "my-vpc"
  cidr_block = "10.0.0.0/16"

  public_subnet_cidrs  = ["10.0.0.0/24", "10.0.1.0/24"]
  private_subnet_cidrs = ["10.0.2.0/24", "10.0.3.0/24"]
  availability_zones   = ["us-east-1a", "us-east-1b"]

  igw         = "my-igw"
  eip         = "my-eip"
  nat_gateway = "my-nat-gateway"
}

# EKS Module
module "eks" {
  source = "./modules/eks"

  cluster_name       = "my-cluster"
  cluster_role_name  = "my-cluster-role"
  node_role_name     = "my-node-role"
  node_group_name    = "workers"
  instance_types     = ["t3.medium"]

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnet_ids
}
