provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_instance" "app_server" {
  ami           = "ami-0ba62214afa52bec7" # Update dengan AMI Singapore
  instance_type = "t2.micro"

  vpc_security_group_ids = ["sg-00a71892e64d09d45"]

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
  vpc_id      = "vpc-0bbb39eaf3df2752e"  # Ganti dengan default VPC ID kamu dari AWS Console

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


