<!-- BEGIN_TF_DOCS -->
## Usage

Basic usage of this module is as follows:

```hcl
module "waf" {
  source = "git@github.com:giovannirossini/terraform.git//aws/modules/waf"
}
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_waf_byte_match_set.admin_area](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/waf_byte_match_set) | resource |
| [aws_waf_byte_match_set.api](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/waf_byte_match_set) | resource |
| [aws_waf_byte_match_set.google_bot](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/waf_byte_match_set) | resource |
| [aws_waf_geo_match_set.brazil_only](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/waf_geo_match_set) | resource |
| [aws_waf_geo_match_set.unwanted_countries](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/waf_geo_match_set) | resource |
| [aws_waf_rate_based_rule.block_api_based_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/waf_rate_based_rule) | resource |
| [aws_waf_rate_based_rule.block_google_based_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/waf_rate_based_rule) | resource |
| [aws_waf_regex_match_set.rm_unwanted_bots](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/waf_regex_match_set) | resource |
| [aws_waf_regex_pattern_set.rp_unwanted_bots](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/waf_regex_pattern_set) | resource |
| [aws_waf_rule.admin_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/waf_rule) | resource |
| [aws_waf_rule.brazil_only_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/waf_rule) | resource |
| [aws_waf_rule.google_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/waf_rule) | resource |
| [aws_waf_rule.header_size_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/waf_rule) | resource |
| [aws_waf_rule.sql_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/waf_rule) | resource |
| [aws_waf_rule.unwanted_bots_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/waf_rule) | resource |
| [aws_waf_rule.unwanted_countries_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/waf_rule) | resource |
| [aws_waf_rule.xss_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/waf_rule) | resource |
| [aws_waf_size_constraint_set.header_size](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/waf_size_constraint_set) | resource |
| [aws_waf_sql_injection_match_set.sql_set](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/waf_sql_injection_match_set) | resource |
| [aws_waf_web_acl.web_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/waf_web_acl) | resource |
| [aws_waf_xss_match_set.xss_match_set](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/waf_xss_match_set) | resource |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_web_acl_id"></a> [web\_acl\_id](#output\_web\_acl\_id) | The ID of the Web ACL. |
<!-- END_TF_DOCS -->