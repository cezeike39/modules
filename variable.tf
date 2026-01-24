variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string

}
variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}
variable "availability_zones" {
  description = "List of availability zones for the subnets"
  type        = list(string)
}
variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}
variable "igw" {
  description = "The name of the Internet Gateway"
  type        = string

}
variable "private_route_cidr" {
  description = "The CIDR block for private route"
  type        = string

}
variable "public_route_cidr" {
  description = "The CIDR block for public route"
  type        = string
}
variable "eip" {
  description = "The Elastic IP for NAT Gateway"
  type        = string
}
variable "nat_gateway" {
  description = "The name of the NAT Gateway"
  type        = string
}
variable "node_role_name" {
  description = "The name of the EKS Node IAM Role"
  type        = string
}
variable "cluster_role_name" {
  description = "The name of the EKS Cluster IAM Role"
  type        = string
}
variable "cluster_name" {
  description = "The name of the EKS Cluster"
  type        = string

}
variable "eks_version" {
  description = "The version of the EKS Cluster"
  type        = string
}
variable "node_group_name" {
  description = "The name of the EKS Node Group"
  type        = string
}
variable "instance_types" {
  description = "The instance types for the EKS Node Group"
  type        = list(string)
}
variable "desired_size" {
  description = "The desired size of the EKS Node Group"
  type        = number
}
variable "max_size" {
  description = "The maximum size of the EKS Node Group"
  type        = number
}
variable "min_size" {
  description = "The minimum size of the EKS Node Group"
  type        = number
}