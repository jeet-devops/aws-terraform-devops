terraform {
  required_version = "~>1.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {

  region = "us-east-1"

}

resource "aws_instance" "nginx" {

  ami           = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"
  user_data     = file("${path.module}/install.sh")
  tags = {
    "Name" = "Nginx"
  }




}



