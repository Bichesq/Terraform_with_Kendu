resource "aws_vpc" "dev_vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = default

  tags = {
    Name = "dev_vpc"
  }
}

resource "aws_internet_gateway" "dev_igw" {
  vpc_id = aws_vpc.dev_vpc.id
  
  tags = {
    Name = "dev_igw"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.dev_vpc.id
  cidr_block = var.public_subnet_cidr_block

  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.dev_vpc.id
  cidr_block = var.private_subnet_cidr_block

  tags = {
    Name = "Private_subnet"
  }
}

