<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->


## Usage
Basic usage of this module is as follows:

```hcl
module "s3" {
	 source  = "git@github.com:giovannirossini/terraform.git//aws/modules/s3"

# Optional Inputs
	 acl  = "private"
	 application  = "Mock"
	 environment  = "Development"
	 name  = "Aletheia"
	 region  = "us-east-1"
	 sse_algorithm  = "AES256"
	 tags  = {
        "Environment": "Development",
        "ManagedBy": "Terraform"
      }
	 versioning_enabled  = false
}
```

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acl"></a> [acl](#input\_acl) | The [canned ACL](https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl) to apply. | `string` | `"private"` | no |
| <a name="input_application"></a> [application](#input\_application) | The deployment application | `string` | `"Mock"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The deployment environment state (eg. production, staging, tests) | `string` | `"Development"` | no |
| <a name="input_name"></a> [name](#input\_name) | The project name | `string` | `"Aletheia"` | no |
| <a name="input_region"></a> [region](#input\_region) | The id of the specific region to retrieve. | `string` | `"us-east-1"` | no |
| <a name="input_sse_algorithm"></a> [sse\_algorithm](#input\_sse\_algorithm) | The server-side encryption algorithm to use. Valid values are `AES256` and `aws:kms` | `string` | `"AES256"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags | `map(any)` | <pre>{<br>  "Environment": "Development",<br>  "ManagedBy": "Terraform"<br>}</pre> | no |
| <a name="input_versioning_enabled"></a> [versioning\_enabled](#input\_versioning\_enabled) | A state of versioning. Versioning is a means of keeping multiple variants of an object in the same bucket | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Bucket ID |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->