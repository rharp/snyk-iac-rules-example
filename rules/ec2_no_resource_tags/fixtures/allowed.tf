resource "aws_instance" "example" {
  ami           = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
  instance_type = "t3.micro"

  tags = {
    Name = "example"
  }
}
