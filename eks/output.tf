output "eks_cluster_id" {
  description = "The ID of the EKS Cluster"
  value       = aws_eks_cluster.eks_cluster.id
  
}
output "eks_cluster_endpoint" {
  description = "The endpoint of the EKS Cluster"
  value       = aws_eks_cluster.eks_cluster.endpoint
}
output "eks_cluster_certificate_authority_data" {
  description = "The certificate authority data for the EKS Cluster"
  value       = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}