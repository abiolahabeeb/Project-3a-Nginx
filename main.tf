#terraform
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

# EC2 instance with userdata
resource "aws_instance" "ec2" {
  ami           = var.instance_ami  #ami
  instance_type = var.instance_type #instance type

  vpc_security_group_ids = [aws_security_group.ec2_sg.id] #sg

  key_name  = var.ec2_key_pair
  user_data = file("${path.module}/userdata.tpl")

  tags = {
    Name = var.tag_name
  }
  depends_on = [var.ec2_key_pair]
}

# Use defualt VPC
resource "aws_default_vpc" "default" {

}

# Security group for the ec2-instance
resource "aws_security_group" "ec2_sg" {
  vpc_id      = aws_default_vpc.default.id
  description = "allow ssh on port 22 & http on port 80"

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.tag_name_sg
  }
}
