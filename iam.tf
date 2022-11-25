provider "aws" {
  region  = var.region
}

data "aws_iam_policy_document" "list_all_my_buckets" {
  statement {
    actions   = ["s3:ListAllMyBuckets"]
    resources = ["arn:aws:s3:::*"]
    effect = "Allow"
  }
}

resource "aws_iam_policy" "list_all_my_buckets" {
  name        = "list_all_my_buckets_policy"
  description = "Policy for Terraform Training"

  policy = data.aws_iam_policy_document.list_all_my_buckets.json
}

