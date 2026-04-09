terraform {
    required_providers {
        aws ={
            source = "hashicorp/aws"
            version = "~> 6.0"
        }
    }
    required_version = ">= 1.8.4"
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

resource "aws_instance" "web" {
    ami = data.aws_ami.amazon_linux.id
    instance_type = "t2.micro"

    tags = {
        Name = "ParkersWebsite"
    }
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_s3_bucket" "b" {
    bucket = "parker-bucket-test-54321"
}

resource "aws_ecr_repository" "ecr" {
  name = "parkers_ecr_repo"
}

# import {  # only used if ECR repo is aready created
#     to = aws_ecr_repository.ecr
#     id = "parkers_ecr_repo"
#   }

