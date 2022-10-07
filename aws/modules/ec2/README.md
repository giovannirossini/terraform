# Elastic Compute Cloud
This is a Terraform configuration to deploy a virtual machine on Amazon EC2.

## Implementation details

This Terraform configuration creates:

-  EC2 instance
-  Elastic IP

You can use it combine with [Network Module](https://github.com/giovannirossini/terraform/tree/main/aws/network):
```yaml
module "network" {
  source  = "./network"
}

module "ec2" {
  source            = "./ec2"
  name              = "application"
  instance_type     = "t3a.micro"
  volume_size       = 8
  subnet_id         = module.network.subnet[0]
  sg_id             = module.network.sg_default_id
  instances_number  = 4
}
```

<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.6.0 |
| <a name="provider_local"></a> [local](#provider\_local) | n/a |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_eip.eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_instance.ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_key_pair.sshkey](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [local_file.ssh_private_key](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [local_file.ssh_public_key](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [tls_private_key.ssh](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami"></a> [ami](#input\_ami) | The AMI ID | `string` | `""` | no |
| <a name="input_az"></a> [az](#input\_az) | The availability zone | `list(string)` | <pre>[<br>  "a",<br>  "b",<br>  "c"<br>]</pre> | no |
| <a name="input_delete_on_termination"></a> [delete\_on\_termination](#input\_delete\_on\_termination) | The delete on termination | `bool` | `true` | no |
| <a name="input_ebs_optimized"></a> [ebs\_optimized](#input\_ebs\_optimized) | The EBS optimized | `bool` | `true` | no |
| <a name="input_encrypted"></a> [encrypted](#input\_encrypted) | The volume will be encrypted | `bool` | `false` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The instance type | `string` | `"t3a.micro"` | no |
| <a name="input_instances_number"></a> [instances\_number](#input\_instances\_number) | The number of instances | `number` | `1` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | The key name | `string` | `"production"` | no |
| <a name="input_monitoring"></a> [monitoring](#input\_monitoring) | The monitoring | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | The name for the resource | `string` | `"production"` | no |
| <a name="input_sg_id"></a> [sg\_id](#input\_sg\_id) | The security group ID | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The subnet ID | `string` | n/a | yes |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | The volume size | `number` | `8` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the EC2 instance |
| <a name="output_public_dns"></a> [public\_dns](#output\_public\_dns) | The DNS name of the EC2 instance |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | The IP address of the EC2 instance |
<!-- END_TF_DOCS -->