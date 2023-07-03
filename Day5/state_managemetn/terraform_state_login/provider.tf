terraform {
  backend "s3" {
    bucket = "dev_tfstate_254114"
    key = "dev_project/terraform_state_locking/terraform.tfstate"
    region = "eu-central-1"
  }

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
  }

