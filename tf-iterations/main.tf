locals {
  default_tags = "${tomap({
    "Project" = "Avenger"
    "Team" =  "Dev"
    "Dept" = "Engineering"
    })}"
}


# locals {
#   common_tags = "${map(
#     "Project", "openshift",
#     "KubernetesCluster", "${var.cluster_id}",
#     "kubernetes.io/cluster/${var.cluster_name}", "${var.cluster_id}"
#   )}"
# }

# resource "aws_instance" "master" {
#   //  Use our common tags and add a specific name.
#   tags = "${merge(
#     local.common_tags,
#     map(
#       "Name", "OpenShift Master"
#     )
#   )}"
# }

# resource "aws_key_pair" "instance_keypair" {
#   key_name = var.instance_keypair
#   public_key = file("${path.module}/nginx.pem")
  
# }

resource "aws_instance" "nginx" {

  ami           = data.aws_ami.ami_name.id
  instance_type = element(var.instance_type,0)
  user_data     = file("${path.module}/install.sh")
  key_name = var.instance_keypair

  count = var.server_count
  
  tags = "${merge(
    local.default_tags,
    tomap({
      "Name" = "NginxServer-${count.index}"
      }
    )

  )}"


  vpc_security_group_ids  = [
  
    "${aws_security_group.allow_http.id}",
    "${aws_security_group.allow_ssh.id}"
    ]

    depends_on = [
      aws_security_group.allow_http,
      aws_security_group.allow_ssh 
    ]

}
