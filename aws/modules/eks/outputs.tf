output "cluster_name" {
  description = "The cluster name"
  value       = aws_eks_cluster.cluster.name
}