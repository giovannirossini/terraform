
resource "aws_security_group" "cluster-sg" {
  vpc_id      = var.vpc_id
  name        = "k8s-cluster"
  description = "Cluster communication with worker nodes"

  egress {
    to_port   = 0
    protocol  = "-1"
    from_port = 0
    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }

  tags = {
    Name = var.name
  }
}

resource "aws_security_group_rule" "cluster-ingress-workstation-https" {
  type              = "ingress"
  to_port           = 443
  security_group_id = aws_security_group.cluster-sg.id
  protocol          = "tcp"
  from_port         = 443
  description       = "Allow workstation to communicate with the cluster API Server"

  cidr_blocks = [
    "0.0.0.0/0",
  ]
}

