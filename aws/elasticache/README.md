# ElastiCache
This is a Terraform configuration to deploy a Redis cluster on Amazon ElastiCache.

By default, it deploys a cluster with a cache.t3.micro instance.

## Implementation details

This Terraform configuration creates:

- Subnet Group for ElastiCache
- Redis Cluster
- Redis Instances

You can use it combine with the [Network module](https://github.com/giovannirossini/terraform-aws/tree/main/network#network):

```yaml
module "network" {
  source  = "./network/module/"
}

module "elasticache" {
  source          = "./elasticache/module/"
  subnet          = module.network.subnet
  sg_id           = module.network.sg_redis_id
  number_of_nodes = 2
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
| [aws_elasticache_cluster.redis](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_cluster) | resource |
| [aws_elasticache_subnet_group.subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_engine"></a> [engine](#input\_engine) | Engine | `string` | `"redis"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | Engine version | `string` | `"3.2.10"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The Type of Redis Instance | `string` | `"cache.t3.micro"` | no |
| <a name="input_name"></a> [name](#input\_name) | Cluster name | `string` | `"redis-production"` | no |
| <a name="input_number_of_nodes"></a> [number\_of\_nodes](#input\_number\_of\_nodes) | How many nodes will assigned to cluster | `number` | `1` | no |
| <a name="input_parameter_group"></a> [parameter\_group](#input\_parameter\_group) | Default parameter group | `string` | `"default.redis3.2"` | no |
| <a name="input_port"></a> [port](#input\_port) | Port to the service | `number` | `6379` | no |
| <a name="input_sg_id"></a> [sg\_id](#input\_sg\_id) | The SG of Redis ID | `string` | n/a | yes |
| <a name="input_subnet"></a> [subnet](#input\_subnet) | The subnet ID | `list(string)` | n/a | yes |
<!-- END_TF_DOCS -->