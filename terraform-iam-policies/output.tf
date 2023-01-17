output "s3_policy_doc" {

  value = data.aws_iam_policy_document.s3_public_access.json

}