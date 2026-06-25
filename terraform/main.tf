provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "server" {
  ami           = "ami-06468be052a4195a6"
  instance_type = "t3.micro"
  key_name      = "my-key"

  tags = {
    Name = "terraform-server"
  }
}

output "108.130.116.233" {
  value = aws_instance.server.public_ip
}