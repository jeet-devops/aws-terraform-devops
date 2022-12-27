locals {
  default_tags = [
  {
      key   = "Name"
      value = "Nginx"
    },
    {
      key   = "Team"
      value = "Dev"
    },
    {
      key  = "Dept"
      value = "Engineering"
    },
  ]
}





resource "aws_instance" "nginx" {

  ami           = data.aws_ami.ami_name.id
  instance_type = element(var.instance_type,0)
  user_data     = file("${path.module}/install.sh")
  
  tags = {
    for tag in local.default_tags:
    tag.key => tag.value

  }
  
  vpc_security_group_ids  = [
  
    "${aws_security_group.allow_http.id}",
    "${aws_security_group.allow_ssh.id}"
    ]

    depends_on = [
      aws_security_group.allow_http,
      aws_security_group.allow_ssh 
    ]

}
