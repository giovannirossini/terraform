variable "region" {
  type        = string
  default     = "us-east-1"
  description = "The id of the specific region to retrieve."
}

variable "environment" {
  type        = string
  default     = "Development"
  description = "The deployment environment state (eg. production, staging, tests)"
}

variable "name" {
  type        = string
  default     = "Aletheia"
  description = "The project name"
}

variable "sse_algorithm" {
  type        = string
  default     = "AES256"
  description = "The server-side encryption algorithm to use. Valid values are `AES256` and `aws:kms`"
}

variable "acl" {
  type        = string
  default     = "private"
  description = "The [canned ACL](https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl) to apply."
}

variable "versioning_enabled" {
  type        = bool
  default     = false
  description = "A state of versioning. Versioning is a means of keeping multiple variants of an object in the same bucket"
}

variable "tags" {
  type = map(any)
  default = {
    "Environment" = "Development"
    "ManagedBy"   = "Terraform"
  }
  description = "A map of tags"
}