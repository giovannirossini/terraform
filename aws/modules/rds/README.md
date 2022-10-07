# Amazon RDS
This is a Terraform configuration to deploy a MySQL RDS Aurora cluster on Amazon RDS.

By default, it deploys a cluster with 3 instances each with 1vCPU and 2G of memory RAM, multi-az enabled.

## Implementation details

This Terraform configuration creates:

- Subnet Group for RDS
- Cluster RDS
- Cluster Instances
- Random Password

You can use it combine with the [Network module](https://github.com/giovannirossini/terraform-aws/tree/main/network#network):

```yaml
module "network" {
  source  = "./network"
}

module "mysql" {
  source          = "./rds/module/"
  name            = "production"
  db_name         = "test"
  db_user         = "admin"
  instance_class  = "db.t3.medium"
  subnets         = module.network.subnet
  sg_id           = module.network.sg_rds_id
}
```

Known issues
When try to destroy:
```sh
Error: RDS Cluster FinalSnapshotIdentifier is required when a final snapshot is required
```
<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.6.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_db_subnet_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_rds_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster) | resource |
| [aws_rds_cluster_instance.instances](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster_instance) | resource |
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_az"></a> [az](#input\_az) | The name for the resource | `list(string)` | <pre>[<br>  "a",<br>  "b",<br>  "c"<br>]</pre> | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | The name for the database | `string` | `"production"` | no |
| <a name="input_db_user"></a> [db\_user](#input\_db\_user) | The name for the database user | `string` | `"root"` | no |
| <a name="input_engine"></a> [engine](#input\_engine) | What engine your RDS will run | `string` | `"aurora-mysql"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | The version of enginee | `string` | `"5.7.mysql_aurora.2.07.2"` | no |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | The instance class for the RDS instance | `string` | `"db.t3.small"` | no |
| <a name="input_maintenance"></a> [maintenance](#input\_maintenance) | Preferred maintenance window | `string` | `"02:00-05:00"` | no |
| <a name="input_mode"></a> [mode](#input\_mode) | The mode of the RDS instance | `string` | `"provisioned"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name for the resource | `string` | `"production"` | no |
| <a name="input_port"></a> [port](#input\_port) | The port for the RDS instance | `number` | `"3306"` | no |
| <a name="input_protection"></a> [protection](#input\_protection) | Deletion protection | `bool` | `true` | no |
| <a name="input_retention_period"></a> [retention\_period](#input\_retention\_period) | Number of days retation days of a backup | `number` | `1` | no |
| <a name="input_sg_id"></a> [sg\_id](#input\_sg\_id) | The security group ID | `string` | `"sg-00001"` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | The list of subnets IPs | `list(string)` | <pre>[<br>  "10.0.0.0/20",<br>  "10.0.1.0/20",<br>  "10.0.2.0/20"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | The endpoint of the RDS |
| <a name="output_password"></a> [password](#output\_password) | The password of the RDS |
<!-- END_TF_DOCS -->