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


data "aws_vpc" "selected" {
  id = var.vpc_id
}

locals {
cidr_block        = cidrsubnets(data.aws_vpc.selected.cidr_block, 4, 4, 8, 4)
}

resource "aws_subnet" "my_subnet" {
  for_each          = toset(local.cidr_block)
  vpc_id            = data.aws_vpc.selected.id
  cidr_block        = each.key

}

