# Route53
This is a Terraform configuration to deploy a DNS Zone on [Route53][aws].

By default, it deploys a single DNS Zone.

## Implementation details

This Terraform configuration creates:

- Route53 DNS Zone

```yaml
module "route53" {
  source = "./route53/module/"
  domain_name = "example.com"
}
```
<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) |  ~> 4.6.0 |

## Resources

| Name | Type |
|------|------|
| [aws_route53_zone.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The domain name. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the DNS Zone. |
<!-- END_TF_DOCS -->