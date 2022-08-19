
output "IAM_User_Name" {
    value = aws_iam_user.kafka.name
}


output "IAM_User_ID" {
    value = aws_iam_user.kafka.id
}

output "aws_iam_access_key" {
    value = aws_iam_access_key.kafka.secret
  
}

output "aws_iam_user_policy" {
  value = aws_iam_user_policy.kafka_up.policy
}