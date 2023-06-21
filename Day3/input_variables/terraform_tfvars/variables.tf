variable "dev_ami" {
  description = "dev_ami"
  type = string
}

variable "dev_instance_type" {
  description = "dev_instance_type"
  type = string
}

variable "dev_vpc_cidr_block" {
  description = "dev_vpc_cidr_block"
  type = string
}

variable "dev_public_subnet_cidr_block" {
  description = "dev_pubic_subnet_cidr_block"
  type = string
}

variable "dev_private_subnet_cidr_block" {
  description = "dev_private_subnet_cidr_block"
  type = string
}