terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Specify the version you want
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "west_instance" {
  ami           = "ami-08c47e4b2806964ce" # Amazon Linux 2 AMI for us-west-2
  instance_type = "t2.micro"
  subnet_id     = "subnet-03b61f596219587a5"
  key_name      = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install nginx1 -y
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = {
    Name = "WestInstance"
  }
}

provider "aws" {
  alias  = "east"
  region = "us-east-1"
}

resource "aws_instance" "east_instance" {
  provider      = aws.east
  ami           = "ami-0103953a003440c37" # Amazon Linux 2 AMI for us-east-1
  instance_type = "t2.micro"
  subnet_id     = "subnet-0469947ab38f9287d"
  key_name      = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install nginx1 -y
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = {
    Name = "EastInstance"
  }
}
