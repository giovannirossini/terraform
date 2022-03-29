variable "name" {
  description = "Name of the ALB"
  default     = "production"
  type        = string
}

variable "instance_id" {
  description = "The ID of the EC2 instance"
  type        = list(string)
  default     = []
}

variable "instance_port" {
  description = "The port of the EC2 instance"
  type        = number
  default     = 80
}

variable "type" {
  description = "The type of ALB"
  type        = string
  default     = "application"
}

variable "is_internal" {
  description = "Is the ALB internal"
  type        = bool
  default     = false
}

variable "port" {
  description = "The port of the ALB"
  type        = number
  default     = 80
}

variable "protocol" {
  description = "The protocol of the ALB"
  type        = string
  default     = "HTTP"
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "sg_id" {
  description = "The ID of the security group"
  type        = list(string)
}

variable "subnets" {
  description = "The IDs of the subnets"
  type        = list(string)
}