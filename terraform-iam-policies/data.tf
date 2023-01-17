data "aws_iam_policy_document" "s3_public_access" {

  statement {

    sid = "aws_s3_readonly"

    not_principals {
      type        = "AWS"
      identifiers = ["${data.aws_iam_user.tf_iam_user.arn}"]
    }
    effect = "Deny"

    actions = [
      "s3:GetObject",
      "s3:ListBucket"
    ]

    resources = [
      "${data.aws_s3_bucket.s3_bucket_name.arn}",
      "${data.aws_s3_bucket.s3_bucket_name.arn}/config/*"
    ]

  }


    statement {

    sid = "aws_s3_readonly_2"

    principals {
      type        = "AWS"
      identifiers = [
                    "${data.aws_iam_user.tf_iam_user.arn}",
                    "${data.aws_iam_user.tf_iam_user2.arn}" 
                    ]
    }
    effect = "Allow"

    actions = [
      "s3:GetObject",
      "s3:ListBucket"
    ]

    resources = [
      "${data.aws_s3_bucket.s3_bucket_name.arn}",
      "${data.aws_s3_bucket.s3_bucket_name.arn}/userdata/*"
    ]

  }

}

data "aws_s3_bucket" "s3_bucket_name" {

  bucket = "appdevteam1-data"

}

data "aws_iam_user" "tf_iam_user" {

  user_name = "app_user1"

}


data "aws_iam_user" "tf_iam_user2" {

  user_name = "app_user2"

}
