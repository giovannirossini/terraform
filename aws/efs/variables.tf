variable "name" {
  description = "The name for the resource"
  type = string
  default = "efs"
}

variable "sg_id" {
  description = "The ID of the security group"
  type = list(string)
  default = ["sg-xxxx"]
}

variable "subnets" {
  description = "The IDs of the subnets"
  type = list(string)
  default = ["subnet-xxxx"]
}

variable "encrypted" {
  description = "The file sytem will be a encypted"
  type = bool
  default = false
}

variable "mode" {
  description = "The performance mode of file system"
  type = string
  default = "generalPurpose"

}

variable "throughput_mode" {
  description = "The throughput mode of file system"
  type = string
  default = "bursting"
}

variable "root_path" {
  description = "The root path to file system"
  type = string
  default = "/"
}