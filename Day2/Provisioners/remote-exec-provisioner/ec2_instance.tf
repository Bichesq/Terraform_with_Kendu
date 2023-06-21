# Development instance

resource "aws_instance" "dev" {
  ami           = "ami-07151644aeb34558a"
  instance_type = "t2.micro"
  key_name = "dev-prod"
  vpc_security_group_ids = ["sg-0369c85ae544c760c"]
 # count = 2

  tags = {
    Account = "dev-account"
    Name = "HelloWorld"
}
/*
provisioner "file" {
    source      = "app/"
    destination = "/home/ec2-user"
}*/
 connection {
    type     = "ssh"
    user     = "ec2-user"
    password = ""
    host     = self.public_ip
    private_key = file("key-pair/dev-prod.pem")
  }
  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y httpd.x86_64",
      "sudo systemctl start httpd.service",
      "sudo systemctl enable httpd.service"
    ]
  }
}