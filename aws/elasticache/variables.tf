variable "subnet" {
  description = "The subnet ID"
  type        = list(string)
}

variable "sg_id" {
  description = "The SG of Redis ID"
  type        = string
}

variable "instance_type" {
  description = "The Type of Redis Instance"
  type        = string
  default     = "cache.t3.micro"
  validation {
    condition     = can(regex("^(cache).[a-z0-9]{1,3}.[a-z]{1,7}", var.instance_type))
    error_message = "The instance type must be a valid type. Ex: cache.t3.micro."
  }
}

variable "name" {
  description = "Cluster name"
  type        = string
  default     = "redis-production"
}

variable "engine" {
  description = "Engine"
  type        = string
  default     = "redis"
}

variable "engine_version" {
  description = "Engine version"
  type        = string
  default     = "3.2.10"
}

variable "parameter_group" {
  description = "Default parameter group"
  type        = string
  default     = "default.redis3.2"
}

variable "port" {
  description = "Port to the service"
  type        = number
  default     = 6379
}

variable "number_of_nodes" {
  description = "How many nodes will assigned to cluster"
  type        = number
  default     = 1
}