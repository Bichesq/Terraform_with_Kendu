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
  shared_config_files = "~/.ssh/config"
  shared_credentials_files = "~/.ssh/credentials"
  profile = "default"
}

resource "aws_instance" "web" {
  ami           = "ami-0715c1897453cabd1"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}
