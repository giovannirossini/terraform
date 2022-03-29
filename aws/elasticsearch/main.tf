data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

resource "aws_iam_service_linked_role" "es" {
  aws_service_name      = "es.amazonaws.com"
}

resource "aws_elasticsearch_domain" "es" {
  depends_on            = [aws_iam_service_linked_role.es]
  domain_name           = var.domain
  elasticsearch_version = var.engine_version

  cluster_config {
    instance_type       = var.instance_type
    instance_count      = var.instance_count
  }
  
  vpc_options {
    subnet_ids          = [var.subnet]
    security_group_ids  = [var.sg_id]
  }

  ebs_options {
    ebs_enabled         = var.ebs_enabled
    volume_type         = "gp2"
    volume_size         = var.ebs_size
  }

  domain_endpoint_options {
    enforce_https       = false
    tls_security_policy = "Policy-Min-TLS-1-0-2019-07"
  }

  access_policies       = <<CONFIG
  {
      "Version": "2012-10-17",
      "Statement": [
          {
              "Action": "es:*",
              "Principal": "*",
              "Effect": "Allow",
              "Resource": "arn:aws:es:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:domain/${var.domain}/*"
          }
      ]
  }
  CONFIG

  tags                  = {
    Name                = var.domain
    Domain              = var.domain
  }
}