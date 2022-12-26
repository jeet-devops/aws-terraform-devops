data "aws_resourcegroupstaggingapi_resources" "test" {}

output "resource_tags" {

    value = data.aws_resourcegroupstaggingapi_resources.test.resource_tag_mapping_list
  
}