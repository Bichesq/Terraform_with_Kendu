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
  region     = "us-east-1"
  access_key = "AKIATYVFBRG5AZPLUG5Q"
  secret_key = "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"
  # Configuration options
}

resource "aws_instance" "web" {
  ami           = "ami-0715c1897453cabd1"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}