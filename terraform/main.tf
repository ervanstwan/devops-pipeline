provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_instance" "app_server" {
  ami           = "ami-04173560437081c75" # Update dengan AMI Singapore
  instance_type = "t2.micro"

  vpc_security_group_ids = ["sg-0783d7a80f0100a8e"]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install nginx1 -y
              systemctl start nginx
              systemctl enable nginx
              echo "Deployed via Terraform 🚀" > /usr/share/nginx/html/index.html
              EOF

  tags = {
    Name = "AppServer"
  }
}

output "instance_public_ip" {
  value = aws_instance.app_server.public_ip
}

resource "aws_security_group" "allow_web" {
  name        = "allow_web"
  description = "Allow HTTP inbound traffic"
  vpc_id      = "vpc-04236a86e95c878c8"  # Ganti dengan default VPC ID kamu dari AWS Console

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Artinya: Terbuka untuk semua IP publik
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Semua trafik keluar diizinkan
  }
}


