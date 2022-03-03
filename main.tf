provider "aws" {
  region = "ap-south-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "devopsbyexample-tf-state1"
    key    = "platform.tfstate"
    region = "ap-south-1"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "ubuntu" {
  ami           = "ami-041aae81ed72817fd"
  instance_type = "t3.micro"
  subnet_id     = "subnet-01fe06767b694044f"
}