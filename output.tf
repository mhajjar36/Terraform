# output.tf
output "iam_user_name" {
value = aws_iam_user.testuser.name
}

output "iam_user_id" {
value = aws_iam_user.testuser.id
}

output "iam_access_key_id" {
value = aws_iam_access_key.testuser_access.id
sensitive = true
}

output "iam_access_key_secret" {
value = aws_iam_access_key.testuser_access.secret
sensitive = true
}

output "iam_policy" {
 value = aws_iam_user_policy.testuser_policy.policy
}
