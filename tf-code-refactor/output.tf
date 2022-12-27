output "aws_instance_ip" {
description = "Public IP of AWS instance"
value = aws_instance.nginx.public_ip

}


output "aws_instance_dns" {
description = "DNS of AWS instance"
value = aws_instance.nginx.public_dns

}


output "aws_instance_tags" {
description = "Tags of AWS instance"
value = aws_instance.nginx.tags

}

output "aws_instance_metadata" {
description = "Metadata of AWS instance"
value = "${aws_instance.nginx.public_dns}/metadata.html"
}

