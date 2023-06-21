
variable "db_name" {
  description = ""
  type = string
  default = "DEV_DB"
  sensitive = true
}

variable "engine" {
  description = "engine"
  type = string
  default = "mysql"
  sensitive = true
}

variable "instance_class" {
  description = "instance_class"
  type = list(string)
  default = ["t2.micro","t2.small","t2.nano"]
  sensitive = true
}

variable "dev_ami" {
  description = "dev_ami"
  type = string
  sensitive = true
  default = ""
}
variable "username" {
  description = "username"
  type = string
  sensitive = true
 #default = "bichesq"
}

variable "password" {
  description = "password"
  type = string
  sensitive = true
 #default = "bichesq123"
}
