resource "aws_vpc" "dev_vpc" {
  cidr_block       = var.dev_vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "dev_vpc"
  }
}

# dev public subnet
# to reference a resourse: resource_name.resource_logical_name.id

resource "aws_subnet" "dev_public_subnet" {
  vpc_id     = aws_vpc.dev_vpc.id
  cidr_block = var.dev_public_subnet_cidr_block

  tags = {
    Name = "dev_public_subnet"
  }
}

resource "aws_subnet" "dev_private_subnet" {
  vpc_id     = aws_vpc.dev_vpc.id
  cidr_block = var.dev_private_subnet_cidr_block

  tags = {
    Name = "dev_private_subnet"
  }
}