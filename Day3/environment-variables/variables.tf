
variable "db_name" {
  description = ""
  type = string
  default = "DEV_DB"
}

variable "engine" {
  description = "engine"
  type = string
  default = "mysql"
}

variable "instance_class" {
  description = "instance_class"
  type = string
  default = "db.t3.micro"
}

variable "username" {
  description = "username"
  type = string
 #default = "bichesq"
}

variable "password" {
  description = "password"
  type = string
 #default = "bichesq123"
}
