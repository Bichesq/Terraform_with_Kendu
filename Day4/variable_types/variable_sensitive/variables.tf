
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
  type = string
  default = "db.t3.micro"
  sensitive = true
}

variable "username" {
  description = "username"
  type = string
  default = "bichesq"
  sensitive = true
}

variable "password" {
  description = "password"
  type = string
  default = "bichesq123"
  sensitive = true
}
