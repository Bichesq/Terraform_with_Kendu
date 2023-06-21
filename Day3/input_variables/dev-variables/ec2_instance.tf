# Development instance

resource "aws_instance" "dev" {
  ami           = var.dev_ami
  instance_type = var.dev_instance_type
  key_name = "dev-prod"
  vpc_security_group_ids = ["sg-0369c85ae544c760c"]
 # count = 2

  tags = {
    Account = "dev-account"
    Name = "HelloWorld"
  }
}