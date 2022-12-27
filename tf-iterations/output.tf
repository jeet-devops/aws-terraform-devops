output "aws_instance_ip" {
description = "Public IP of AWS instance"
value = [ for instance in aws_instance.nginx: instance.public_ip ]
}


output "aws_instance_dns_list" {
description = "DNS of AWS instance List"
value = [ for instance in aws_instance.nginx: instance.public_dns ]

}

output "aws_instance_dns_map" {
description = "DNS of AWS instance Map"
value = { for c, instance in aws_instance.nginx: c => instance.public_dns }

}

output "aws_instance_tags" {
description = "Tags of AWS instance"
value = aws_instance.nginx[*].tags

}
