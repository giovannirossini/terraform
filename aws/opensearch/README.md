# Amazon OpenSearch Service
This is a Terraform configuration to deploy a Elasticseach cluster on Amazon OpenSearch Service.

By default, it deploys a cluster with a t2.small.elastsearch instance.

## Implementation details

This Terraform configuration creates:

- An Elasticsearch cluster
- An Elasticsearch IAM policy

You can use it combine with the [Network module](https://github.com/giovannirossini/terraform-aws/tree/main/network#network):

```yaml
module "network" {
  source  = "./network/module/"
}

module "elasticsearch" {
  source         = "./opensearch"
  domain         = "es-production"
  instance_type  = "t3.small.search"
  instance_count = 1
  subnet         = element(module.network.subnet, 0)
  sg_id          = module.network.sg_elasticsearch_id
  ebs_size       = 10
}
```

<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.6.0 |

## Resources

| Name | Type |
|------|------|
| [aws_elasticsearch_domain.es](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticsearch_domain) | resource |
| [aws_iam_service_linked_role.es](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_service_linked_role) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain"></a> [domain](#input\_domain) | The Elasticsearch Service name used in domain. | `string` | `"elasticsearch"` | no |
| <a name="input_ebs_enabled"></a> [ebs\_enabled](#input\_ebs\_enabled) | The elasticsearch EBS enabled | `bool` | `true` | no |
| <a name="input_ebs_size"></a> [ebs\_size](#input\_ebs\_size) | The Elasticsearch EBS size in GB | `number` | `10` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | The elasticsearch engine version. | `number` | `7.1` | no |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | The Elasticsearch number of instances | `number` | `1` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The Elasticsearch Service instance type | `string` | `"t2.small.elastsearch"` | no |
| <a name="input_sg_id"></a> [sg\_id](#input\_sg\_id) | The Elasticsearch Service Security Group | `string` | n/a | yes |
| <a name="input_subnet"></a> [subnet](#input\_subnet) | The Elasticsearch Service subnet | `string` | n/a | yes |
<!-- END_TF_DOCS -->