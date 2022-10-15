variable "name" {
  description = "The name for the resource"
  type        = string
  default     = "production"
}

variable "ami" {
  description = "The AMI ID"
  type        = string
  default     = ""
}

variable "az" {
  description = "The availability zone"
  type        = list(string)
  default = [
    "a",
    "b",
    "c"
  ]
}

variable "instance_type" {
  description = "The instance type"
  type        = string
  default     = "t3a.micro"
}

variable "key_name" {
  description = "The key name"
  type        = string
  default     = "production"
}

variable "volume_size" {
  description = "The volume size"
  type        = number
  default     = 8
}

variable "instances_number" {
  description = "The number of instances"
  type        = number
  default     = 1
}

variable "sg_id" {
  description = "The security group ID"
  type        = string
  validation {
    condition     = can(regex("^sg-", var.sg_id))
    error_message = "The sg_id value must be a valid Security Group id. Starting with \"sg-\"."
  }
}

variable "subnet_id" {
  description = "The subnet ID"
  type        = string
  validation {
    condition     = can(regex("^subnet-", var.subnet_id))
    error_message = "The subnet_id value must be a valid subnet id. Starting with \"subnet-\"."
  }
}

variable "ebs_optimized" {
  description = "The EBS optimized"
  type        = bool
  default     = true
  validation {
    condition     = can(regex("(true)||(false)", var.ebs_optimized))
    error_message = "The ebs_optimized value must be a boolean. True or False expected."
  }
}

variable "monitoring" {
  description = "The monitoring"
  type        = bool
  default     = true
  validation {
    condition     = can(regex("(true)||(false)", var.monitoring))
    error_message = "The ebs_optimized value must be a boolean. True or False expected."
  }
}

variable "delete_on_termination" {
  description = "The delete on termination"
  type        = bool
  default     = true
  validation {
    condition     = can(regex("(true)||(false)", var.delete_on_termination))
    error_message = "The ebs_optimized value must be a boolean. True or False expected."
  }
}

variable "encrypted" {
  description = "The volume will be encrypted"
  type        = bool
  default     = false
  validation {
    condition     = can(regex("(true)||(false)", var.encrypted))
    error_message = "The ebs_optimized value must be a boolean. True or False expected."
  }
}