# Elastic Kubernetes Service
This is a Terraform configuration to deploy an EKS cluster on Amazon Elastic Kubernetes Service.

By default, it deploys a cluster with two t3a.small  instance node.

## Implementation details

This Terraform configuration creates:

- An EKS cluster
- A Node Group
- An EKS IAM policy
- An EKS Security Group
- An EKS Subnet

You can use it combine with the [Network module](https://github.com/giovannirossini/terraform-aws/tree/main/network#network):

```yaml
module "network" {
  source  = "git@github.com:giovannirossini/terraform.git//aws/modules/network"
}

module "eks" {
  source          = "git@github.com:giovannirossini/terraform.git//aws/modules/eks"
  name            = "production"
  node_group_name = "services"
  number_of_nodes = 2
  max_nodes       = 3
  min_nodes       = 1
  instance_types  = ["t3.medium"]
  subnets         = module.network.subnet
  sg_id           = module.network.sg_default_id
  vpc_id          = module.network.vpc_id
```

<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.6.0 |

## Resources

| Name | Type |
|------|------|
| [aws_eks_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_eks_node_group.nodes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_iam_role.eks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.eks_node](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKSClusterPolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_subnet.eks_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_instance_types"></a> [instance\_types](#input\_instance\_types) | The instance types to use for the EKS cluster | `list(string)` | <pre>[<br>  "t3a.small"<br>]</pre> | no |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | The Kubernetes version to use for the cluster | `string` | `"1.21"` | no |
| <a name="input_max_nodes"></a> [max\_nodes](#input\_max\_nodes) | The maximum number of nodes to use for the EKS cluster | `number` | `5` | no |
| <a name="input_min_nodes"></a> [min\_nodes](#input\_min\_nodes) | The minimum number of nodes to use for the EKS cluster | `number` | `1` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the cluster | `string` | `"eks-production"` | no |
| <a name="input_node_group_name"></a> [node\_group\_name](#input\_node\_group\_name) | The name of the node group | `string` | `"workgroup"` | no |
| <a name="input_number_of_nodes"></a> [number\_of\_nodes](#input\_number\_of\_nodes) | The number of nodes to start use for the EKS cluster | `number` | `3` | no |
| <a name="input_sg_id"></a> [sg\_id](#input\_sg\_id) | The security group ID for the EKS cluster | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Subnets for the EKS cluster | `list(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC ID for the EKS cluster | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | The cluster endpoint |
<!-- END_TF_DOCS -->