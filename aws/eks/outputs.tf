output "run-to-config" {
  description = "Run the following command to configure your ./.kube/config"
  value       = format("aws eks --region %s update-kubeconfig --name %s", module.network.region.name, module.eks.cluster_name)
}