# Elastic File System
This is a Terraform configuration to deploy a File System on Amazon Elastic File System.

By default, it deploys a single file system.

## Implementation details

This Terraform configuration depends on subnet ids and security groups id. It creates:

- File system
- Mount target for each subnet
- Access Point

You can use it combine with the [Network module](https://github.com/giovannirossini/terraform/tree/main/aws/network#network):

```yaml
module "network" {
  source  = "./network/module/"
}

module "efs" {
  source        = "./efs"
  name          = "production"
  subnets       = [for i in module.network.subnet: i]
  sg_id         = [module.network.sg_efs_id]
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
| [aws_efs_access_point.access_point](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_access_point) | resource |
| [aws_efs_file_system.efs_production](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_file_system) | resource |
| [aws_efs_mount_target.production](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_mount_target) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_encrypted"></a> [encrypted](#input\_encrypted) | The file sytem will be a encypted | `bool` | `false` | no |
| <a name="input_mode"></a> [mode](#input\_mode) | The performance mode of file system | `string` | `"generalPurpose"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name for the resource | `string` | `"efs"` | no |
| <a name="input_root_path"></a> [root\_path](#input\_root\_path) | The root path to file system | `string` | `"/"` | no |
| <a name="input_sg_id"></a> [sg\_id](#input\_sg\_id) | The ID of the security group | `list(string)` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | The IDs of the subnets | `list(string)` | n/a | yes |
| <a name="input_throughput_mode"></a> [throughput\_mode](#input\_throughput\_mode) | The throughput mode of file system | `string` | `"bursting"` | no |
<!-- END_TF_DOCS -->