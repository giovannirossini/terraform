variable "domain" {
  description = "The domain name of the certificate."
  type        = string
  validation {
    condition = can(regex("", var.domain))
    error_message = "The domain name is not allowed."
  }
}

variable "zone_id" {
  description = "Zone ID."
  default     = "Z2P70J7EXAMPLE"
}

variable "method" {
  description = "The method of validation."
  default     = "DNS"
}