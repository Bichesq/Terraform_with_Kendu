resource "aws_security_group" "dev_sg" {
  vpc_id = aws_vpc.dev_vpc.id

  ingress = {
    from_port = 80
    to_port = 80
    protocol ="tcp"
  }

  egress {
    from_port = 0 
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]

    tags = {
        Name = "dev_sg"
    }
  }
}