variable "name" {
  description     = "The name for the resource"
  type            = string
  default         = "production"
}

variable "az" {
  description     = "The name for the resource"
  type            =  list(string)
  default         = [
    "a", 
    "b", 
    "c"
  ]
}

variable "db_name" {
  description     = "The name for the database"
  type            = string
  default         = "production"
}

variable "db_user" {
  description     = "The name for the database user"
  type            = string
  default         = "root"
}

variable "instance_class" {
  description     = "The instance class for the RDS instance"
  type            = string
  default         = "db.t3.small"
  validation {
    condition     = can(regex("^(db).[a-z0-9]{1,3}.[a-z]{1,7}", var.instance_class))
    error_message = "The instance class must be a valid type. Ex: db.t3.medium."
  }
}

variable "sg_id" {
  description     = "The security group ID"
  type            = string
  default         = "sg-00001"
}

variable "port" {
  description     = "The port for the RDS instance"
  type            = number
  default         = "3306"
}

variable "subnets" {
  description     = "The list of subnets IPs"
  type            = list(string)
  default         = [
    "10.0.0.0/20", 
    "10.0.1.0/20", 
    "10.0.2.0/20"
  ]
}

variable "protection" {
  description     = "Deletion protection"
  type            = bool
  default         = true
}

variable "retention_period" {
  description     = "Number of days retation days of a backup"
  type            = number
  default         = 1
}

variable "maintenance" {
  description     = "Preferred maintenance window"
  type            = string
  default         = "02:00-05:00"
}

variable "mode" {
  description     = "The mode of the RDS instance"
  type            = string
  default         = "provisioned"
}

variable "engine" {
  description     = "What engine your RDS will run"
  type            = string
  default         = "aurora-mysql"
}

variable "engine_version" {
  description     = "The version of enginee"
  type            = string
  default         = "5.7.mysql_aurora.2.07.2"
}