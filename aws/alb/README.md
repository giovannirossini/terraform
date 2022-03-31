# Application Load Balancer
This is a Terraform configuration to deploy a Application Load Balancer on Amazon EC2.

## Implementation details

This Terraform configuration creates:

-  Application Load Balancer
-  Listener
-  Target Group
-  Target Group Attachment

```yaml
module "loadbalancer" {
  source        = "./alb"
  name          = "frontend"
  instance_id   = [for i in module.backend.ec2_id : i]
  sg_id         = [module.network.sg_alb_id]
  vpc_id        = module.network.vpc_id
  subnets       = module.network.subnet
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
| [aws_lb.alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.target_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group_attachment.instance_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_instance_id"></a> [instance\_id](#input\_instance\_id) | The ID of the EC2 instance | `list(string)` | n/a | yes |
| <a name="input_instance_port"></a> [instance\_port](#input\_instance\_port) | The port of the EC2 instance | `number` | `80` | no |
| <a name="input_is_internal"></a> [is\_internal](#input\_is\_internal) | Is the ALB internal | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the ALB | `string` | `"production"` | no |
| <a name="input_port"></a> [port](#input\_port) | The port of the ALB | `number` | `80` | no |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | The protocol of the ALB | `string` | `"HTTP"` | no |
| <a name="input_sg_id"></a> [sg\_id](#input\_sg\_id) | The ID of the security group | `list(string)` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | The IDs of the subnets | `list(string)` | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | The type of ALB | `string` | `"application"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns_name"></a> [dns\_name](#output\_dns\_name) | The DNS name of the ALB |
<!-- END_TF_DOCS -->