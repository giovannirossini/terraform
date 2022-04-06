output "endpoint" {
  description = "The cluster endpoint"
  value       = aws_eks_cluster.cluster.endpoint
}