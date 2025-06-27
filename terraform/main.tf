provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_instance" "app_server" {
  ami           = "ami-04173560437081c75" # Update dengan AMI Singapore
  instance_type = "t2.micro"

  tags = {
    Name = "AppServer"
  }
}
