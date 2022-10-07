# Network
This is a Terraform configuration to deploy a Virtual Private Cloud network on Amazon Web Services.

By default, it deploys a VPC with a internet gateway, default route table and three subnets (each in an availability zone).

## Implementation details

This Terraform configuration creates:

- VPC
- Internet Gateway
- Default Route Table
- Subnets


```yaml
module "network" {
  source        = "./network"
  name          = "vpc-production"
  az            = ["a","b","c"]
  vpc_cidr      = "100.0.0.0/16"
  subnets_cidr  = ["100.0.1.0/20","100.0.2.0/20","100.0.3.0/20"]
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
| [aws_default_route_table.r](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_route_table) | resource |
| [aws_internet_gateway.gw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_security_group.sg_alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.sg_default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.sg_efs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.sg_elasticsearch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.sg_rds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.sg_redis](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.EC2Subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.vpc_production](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_az"></a> [az](#input\_az) | The availability zones | `list(string)` | <pre>[<br>  "a",<br>  "b",<br>  "c"<br>]</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | The name for the resource | `string` | `"production"` | no |
| <a name="input_public_cidr"></a> [public\_cidr](#input\_public\_cidr) | The cidr value for public access | `string` | `"0.0.0.0/0"` | no |
| <a name="input_subnets_cidr"></a> [subnets\_cidr](#input\_subnets\_cidr) | The list of subnets CIDRs | `list(string)` | <pre>[<br>  "10.0.0.0/20",<br>  "10.0.16.0/20",<br>  "10.0.32.0/20"<br>]</pre> | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | The VPC CIDR | `string` | `"10.0.0.0/16"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sg_alb_id"></a> [sg\_alb\_id](#output\_sg\_alb\_id) | The ID of the ALB security group. |
| <a name="output_sg_default_id"></a> [sg\_default\_id](#output\_sg\_default\_id) | The ID of the default, ssh, security group. |
| <a name="output_sg_efs_id"></a> [sg\_efs\_id](#output\_sg\_efs\_id) | The ID of the EFS security group. |
| <a name="output_sg_elasticsearch_id"></a> [sg\_elasticsearch\_id](#output\_sg\_elasticsearch\_id) | The ID of the Elasticsearch security group. |
| <a name="output_sg_rds_id"></a> [sg\_rds\_id](#output\_sg\_rds\_id) | The ID of the RDS security group. |
| <a name="output_sg_redis_id"></a> [sg\_redis\_id](#output\_sg\_redis\_id) | The ID of the Redis security group. |
| <a name="output_subnet"></a> [subnet](#output\_subnet) | The IDs of the subnets. |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC. |
<!-- END_TF_DOCS -->