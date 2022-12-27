variable "instance_type" {
  
  description = "Type of ami instance"
  type = list(string)
  default = ["t2.micro", "t3.micro", "t3.medium"]

}

variable "region" {

 description = "AWS region"
 type = string
 default = "us-east-1"

  
}

variable "default_tags" {
  description = "Default AMI tags"
  type = map(string)
  default = {
    "Name" = "Nginx"
    "Team"  = "Dev"
    "Dept"  = "Engineering"
  }
  
   
 
  
}