terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.51.0"
    }
  }
}

provider "aws" {
    region="us-east-1"
  # Configuration options
}


data  "aws_vpc" "get_network" {
 
}

output "op" {
    value = data.aws_vpc.get_network.arn
}

