provider "aws" {
  region                      = var.region
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  access_key                  = var.access_key
  secret_key                  = var.secret_key
}

resource "aws_instance" "not-web" {
  ami           = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
  instance_type = "t3.micro"

  ebs_block_device {
    device_name           = "/dev/sdb"
    encrypted             = true
    volume_type           = "gp2"
    volume_size           = 100
    delete_on_termination = false
  }

  tags = {
    Name = "web-demo"
  }
}
