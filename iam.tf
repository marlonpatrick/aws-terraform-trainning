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

resource "aws_iam_group" "group_created_by_trf" {
  name = "Group Created By Terraform"
  path = "/"
}

resource "aws_iam_user" "user_created_by_trf" {
  name = "user_created_by_terraform"
}

resource "aws_iam_user_group_membership" "training_membership" {
  user   = aws_iam_user.user_created_by_trf.name
  groups = [aws_iam_group.group_created_by_trf.name]
}

resource "aws_iam_user_policy_attachment" "training_attachment" {
  user       = aws_iam_user.user_created_by_trf.name
  policy_arn = aws_iam_policy.list_all_my_buckets.arn
}

