terraform {
  required_version = "1.4.6"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.0.1"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
  profile = "dev-account"
  alias = "dev-env"
}

provider "aws" {
  region = "eu-central-2"
  profile = "prod-account"
  alias = "prod-env"
}

# Development instance

resource "aws_instance" "dev" {
  provider = aws.dev-env
  ami           = "ami-07151644aeb34558a"
  instance_type = "t2.micro"
  count = 2

  tags = {
    Account = "dev-account"
    Name = "HelloWorld"
  }
}

#prod vm
resource "aws_instance" "prod" {
  provider = aws.prod-env
  ami           = "ami-07151644aeb34558a"
  instance_type = "t2.micro"
  count = 2

  tags = {
    Account = "prod-account"
    Name = "HelloWorld"
    
  }
}