# output.tf
output "iam_user_name" {
value = aws_iam_user.miketest.name
}

output "iam_user_id" {
value = aws_iam_user.miketest.id
}

output "iam_access_key_id" {
value = aws_iam_access_key.mikeaccess.id
sensitive = true
}

output "iam_access_key_secret" {
value = aws_iam_access_key.mikeaccess.secret
sensitive = true
}

output "iam_policy" {
 value = aws_iam_user_policy.mike_policy.policy
}