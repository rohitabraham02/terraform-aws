terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
region = "us-east-1"
}



resource "aws_instance" "server" {
  count = 2 # create two similar EC2 instances

  ami           = "ami-0dc2d3e4c0f9ebd18"
  instance_type = "t2.micro"

  tags = {
    Name = "Server ${count.index}"
  }
}
