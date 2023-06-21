variable "dev_ami" {
  description = "dev_ami"
  type = string
  default = "ami-07151644aeb34558a"
}

variable "dev_instance_type" {
  description = "dev_instance_type"
  type = string
  default = "t2.micro"
}

variable "dev_vpc_cidr_block" {
  description = "dev_vpc_cidr_block"
  type = string
  default = "10.0.0.0/16"
}

variable "dev_public_subnet_cidr_block" {
  description = "dev_pubic_subnet_cidr_block"
  type = string
  default = "10.0.0.0/24"
}

variable "dev_private_subnet_cidr_block" {
  description = "dev_private_subnet_cidr_block"
  type = string
  default = "10.0.1.0/24"
}