terraform {
  required_version = "1.5.3"
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
  }

