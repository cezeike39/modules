variable "node_role_name" {
  description = "The name of the EKS Node IAM Role"
  type        = string
  default     = "NodeIamrole"

}
variable "cluster_role_name" {
  description = "The name of the EKS Cluster IAM Role"
  type        = string
  default     = "ClusterIamrole"

}
variable "vpc_id" {
  type        = string
  description = "The VPC ID where EKS cluster will be created"
}

variable "cluster_name" {
  description = "The name of the EKS Cluster"
  type        = string
  default     = "eks-cluster"
}
variable "subnet_ids" {
  description = "Subnet Id"
  type        = list(string)
}

variable "eks_version" {
  description = "The version of the EKS Cluster"
  type        = string
  default     = "1.31"
}
variable "node_group_name" {
  description = "The name of the EKS Node Group"
  type        = string
  default     = "eks-node-group"
}
variable "instance_types" {
  description = "The instance types for the EKS Node Group"
  type        = list(string)
  default     = ["t2.large"]

}
variable "desired_size" {
  description = "The desired size of the EKS Node Group"
  type        = number
  default     = 1

}
variable "max_size" {
  description = "The maximum size of the EKS Node Group"
  type        = number
  default     = 3

}
variable "min_size" {
  description = "The minimum size of the EKS Node Group"
  type        = number
  default     = 1

}