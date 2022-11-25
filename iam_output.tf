output "rendered_policy" {
  value = data.aws_iam_policy_document.list_all_my_buckets.json
}

