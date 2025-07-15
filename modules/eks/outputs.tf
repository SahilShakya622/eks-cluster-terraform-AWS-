output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Cluster security group ID"
  value       = module.eks.cluster_security_group_id
}

output "eks_managed_node_groups" {
  description = "Node group outputs"
  value       = module.eks.eks_managed_node_groups
}

output "cluster_iam_role_arn" {
  description = "IAM role ARN for EKS cluster"
  value       = module.eks.cluster_iam_role_arn
}
