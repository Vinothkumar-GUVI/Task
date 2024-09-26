terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  
  required_version = ">= 1.0"
}

provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "us_west_2"
  region = "us-west-2"
}

resource "aws_instance" "example_east" {
  provider          = aws.us_east_1
  ami               = "ami-0e86e20dae9224db8" # Update with a valid AMI ID for your region
  instance_type    = "t2.micro"
  subnet_id     = "subnet-0469947ab38f9287d"
  tags = {
    Name = "Instance-EAST"
  }
}

resource "aws_instance" "example_west" {
  provider          = aws.us_west_2
  ami               = "ami-05134c8ef96964280" # Update with a valid AMI ID for your region
  instance_type    = "t2.micro"
  subnet_id     = "subnet-03b61f596219587a5"
  tags = {
    Name = "Instance-WEST"
  }
}

