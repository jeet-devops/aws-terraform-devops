
resource "aws_instance" "nginx" {

  ami           = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"
  user_data     = file("${path.module}/install.sh")
  tags = {
    "Name" = "Nginx"
    "Team" = "Dev"
  }




}
