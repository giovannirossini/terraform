variable "name" {
  description = "The name of the cluster"
  type        = string
  default     = "eks-production"
}

variable "node_group_name" {
  description = "The name of the node group"
  type        = string
  default     = "workgroup"
}

variable "subnets" {
  description = "Subnets for the EKS cluster"
  type        = list(string)
}

variable "k8s_version" {
  description = "The Kubernetes version to use for the cluster"
  type        = string
  default     = "1.21"
}

variable "vpc_id" {
  description = "The VPC ID for the EKS cluster"
  type        = string
}

variable "sg_id" {
  description = "The security group ID for the EKS cluster"
  type        = string
}

variable "instance_types" {
  description = "The instance types to use for the EKS cluster"
  type        = list(string)
  default     = ["t3a.small"]
}

variable "number_of_nodes" {
  description = "The number of nodes to start use for the EKS cluster"
  type        = number
  default     = 3
}

variable "max_nodes" {
  description = "The maximum number of nodes to use for the EKS cluster"
  type        = number
  default     = 5
}

variable "min_nodes" {
  description = "The minimum number of nodes to use for the EKS cluster"
  type        = number
  default     = 1
}