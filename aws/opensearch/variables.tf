variable "domain" {
  description = "The Elasticsearch Service name used in domain."
  type        = string
  default     = "elasticsearch"
}

variable "subnet" {
  description = "The Elasticsearch Service subnet"
  type        = string
}

variable "sg_id" {
  description = "The Elasticsearch Service Security Group"
  type        = string
}

variable "instance_type" {
  description = "The Elasticsearch Service instance type"
  type        = string
  default     = "t2.small.elastsearch"
}

variable "ebs_size" {
  description = "The Elasticsearch EBS size in GB"
  type        = number
  default     = 10
}

variable "instance_count" {
  description = "The Elasticsearch number of instances"
  type        = number
  default     = 1
}

variable "engine_version" {
  description = "The elasticsearch engine version."
  type        = number
  default     = 7.10
}

variable "ebs_enabled" {
  description = "The elasticsearch EBS enabled"
  type        = bool
  default     = true
}