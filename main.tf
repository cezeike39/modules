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