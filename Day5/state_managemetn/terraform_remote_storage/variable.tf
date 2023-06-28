variable public_subnet_cidr_block {
  description = "cidr block"
  type = string
  default = "10.0.0.0/24"
}

variable private_subnet_cidr_block {
  description = "cidr block"
  type = string
  default = "10.0.1.0/24"
}

