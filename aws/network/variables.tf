variable "name" {
  description = "The name for the resource"
  type = string
  default = "production"
}

variable "az" {
  description = "The availability zones"
  type =  list(string)
  default = [
    "a",
    "b",
    "c"
  ]
}

variable "vpc_cidr" {
  description = "The VPC CIDR"
  type = string
  default = "10.0.0.0/16"
}

variable "public_cidr" {
  description = "The cidr value for public access"
  type = string
  default = "0.0.0.0/0"
}

variable "subnets_cidr" {
  description = "The list of subnets CIDRs"
  type  = list(string)
  default = [
    "10.0.0.0/20", 
    "10.0.16.0/20", 
    "10.0.32.0/20"
  ]
}
