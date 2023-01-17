

# resource "aws_s3_bucket" "test-bucket" {

#     bucket = var.bucket_name

# }

resource "aws_s3_bucket_policy" "public-read-access" {

  bucket = data.aws_s3_bucket.s3_bucket_name.id
  policy = data.aws_iam_policy_document.s3_public_access.json


}