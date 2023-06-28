# Development instance

resource "aws_instance" "dev" {
  ami           = var.Dev_Instance_AMI_id
  instance_type = var.Dev_Instance_type[2]
  key_name = "dev-prod"
  vpc_security_group_ids = ["sg-0369c85ae544c760c"]
 # count = 2

}