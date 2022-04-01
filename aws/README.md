<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.6.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_certificate-manager"></a> [certificate-manager](#module\_certificate-manager) | ./acm | n/a |
| <a name="module_cloudfront"></a> [cloudfront](#module\_cloudfront) | ./cloudfront | n/a |
| <a name="module_ec2"></a> [ec2](#module\_ec2) | ./ec2 | n/a |
| <a name="module_efs"></a> [efs](#module\_efs) | ./efs | n/a |
| <a name="module_elasticache"></a> [elasticache](#module\_elasticache) | ./elasticache | n/a |
| <a name="module_elasticsearch"></a> [elasticsearch](#module\_elasticsearch) | ./elasticsearch | n/a |
| <a name="module_loadbalancer"></a> [loadbalancer](#module\_loadbalancer) | ./alb | n/a |
| <a name="module_network"></a> [network](#module\_network) | ./network | n/a |
| <a name="module_rds"></a> [rds](#module\_rds) | ./rds | n/a |
| <a name="module_route53"></a> [route53](#module\_route53) | ./route53/ | n/a |
| <a name="module_waf"></a> [waf](#module\_waf) | ./waf | n/a |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_dns_name"></a> [alb\_dns\_name](#output\_alb\_dns\_name) | The DNS name of the ALB |
| <a name="output_ec2_dns"></a> [ec2\_dns](#output\_ec2\_dns) | The DNS name of the EC2 instance |
| <a name="output_ec2_id"></a> [ec2\_id](#output\_ec2\_id) | The ID of the EC2 instance |
| <a name="output_ec2_ip"></a> [ec2\_ip](#output\_ec2\_ip) | The IP address of the EC2 instance |
| <a name="output_efs_id"></a> [efs\_id](#output\_efs\_id) | EFS ID |
| <a name="output_rds_endpoint"></a> [rds\_endpoint](#output\_rds\_endpoint) | RDS Endpoint |
| <a name="output_rds_password"></a> [rds\_password](#output\_rds\_password) | RDS Password |
| <a name="output_route53_zone_id"></a> [route53\_zone\_id](#output\_route53\_zone\_id) | Route53 Zone ID |
<!-- END_TF_DOCS -->

