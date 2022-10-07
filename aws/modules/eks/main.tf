resource "aws_eks_cluster" "cluster" {
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController,
  ]
  name     = var.name
  version  = var.k8s_version
  role_arn = aws_iam_role.eks.arn

  vpc_config {
    subnet_ids = var.subnets
    security_group_ids = [
      aws_security_group.cluster-sg.id,
    ]
  }

  tags = {
    Name = var.name
  }
}

resource "aws_eks_node_group" "nodes" {
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
  node_role_arn   = aws_iam_role.eks_node.arn
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = var.node_group_name
  subnet_ids      = var.subnets
  instance_types  = var.instance_types

  scaling_config {
    desired_size = var.number_of_nodes
    max_size     = var.max_nodes
    min_size     = var.min_nodes
  }

  tags = {
    Name = "${var.node_group_name}-${aws_eks_cluster.cluster.name}"

  }
}
