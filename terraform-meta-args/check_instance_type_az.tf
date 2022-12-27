data "aws_availability_zones" "azs_list" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}


data "aws_ec2_instance_type_offerings" "check_instance_type" {
  
  #for_each = toset(["us-east-1a", "us-east-1b", "us-east-1e"])
   for_each = toset(data.aws_availability_zones.azs_list.names)
  filter {
    name   = "instance-type"
    values = ["t3.micro"]
  }

  filter {
    name   = "location"
    values = [each.key]
  }

  location_type = "availability-zone"
}


output "list-instance-by-type" {

   value = keys({
    
    for az, details in data.aws_ec2_instance_type_offerings.check_instance_type: 
    az => details.instance_types if length(details.instance_types) != 0 
    
    })
}