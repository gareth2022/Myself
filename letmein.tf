provider "aws" {
    region = "us-east-1"
    profile = "default"
  
}

# provision VPC
resource "aws_vpc" "EvaVPC" {
    cidr_block = "10.0.0.0/16"
      tags = {
    Name = "EvaVPC"
  }

  }

# provision subnet
resource "aws_subnet" "Evasub" {
    cidr_block = "10.0.0.0/24"
    vpc_id = aws_vpc.EvaVPC.id
    tags = {
      Name = "Evasub"
    }
}
# provision instance
resource "aws_instance" "foo" {
    instance_type = "t2.micro"
    ami           = "ami-05fa00d4c63e32376"


  }