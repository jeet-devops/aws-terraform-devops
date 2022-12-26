data "aws_resourcegroupstaggingapi_resources" "test" {
    resource_type_filters = ["ec2:instance"]
}

output "resource_tags" {

    value = data.aws_resourcegroupstaggingapi_resources.test.resource_tag_mapping_list
  
}