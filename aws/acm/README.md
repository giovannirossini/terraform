# Amazon Certificate Manager
This is a Terraform configuration to deploy a SSL certificate on Amazon Certificate Manager.

## Implementation details

This Terraform configuration creates:

- SSL certificate
- SSL certificate validation
- SSL certificate association with a domain name

```yaml
module "certificate-manager" {
  source  = "./acm"
  zone_id = module.route53.zone_id
  domain  = "example.com"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.6.0 |

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.cert](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.cert](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) | resource |
| [aws_route53_record.cert_validation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain"></a> [domain](#input\_domain) | The domain name of the certificate. | `string` | n/a | yes |
| <a name="input_method"></a> [method](#input\_method) | The method of validation. | `string` | `"DNS"` | no |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | Zone ID. Z2P70J7EXAMPLE | `string` | n/a | yes |
<!-- END_TF_DOCS -->