# resource "aws_security_group" "allow_http" {
#   name        = "allow_http"
#   description = "Allow HTTP inbound traffic"

#   ingress {
#     description = "TLS from VPC"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]

#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

#   tags = {
#     Name = "allow_http"
#   }
# }


locals {
  http_ports = [{
    "port" = "80"
    "description" = "HTTP traffic"
    "protocol" = "tcp"

  },
  {
    "port" = "443"
    "description" = "HTTPS traffic"
    "protocol" = "tcp"

  }]

}


resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow HTTP inbound traffic"
  
  dynamic "ingress" {
  
  for_each = local.http_ports
  
  content {
    description = ingress.value.description
    from_port   = ingress.value.port
    to_port     = ingress.value.port
    protocol    = ingress.value.protocol
    cidr_blocks = ["0.0.0.0/0"]
      
    }
    
  }
  

  tags = {
    Name = "allow_http"
  }
}




resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}