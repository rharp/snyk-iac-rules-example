resource "aws_instance" "example" {
  ami           = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
  instance_type = "t3.micro"

  ebs_block_device {
    device_name           = "/dev/sdb"
    encrypted             = true
    volume_type           = "gp2"
    volume_size           = 100
    delete_on_termination = false
  }

}
