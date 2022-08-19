resource "aws_iam_user" "kafka" {
  name = var.IAM_User_Name

  tags = {
    tag-key = "Kafka_Storage"
  }
}

resource "aws_iam_access_key" "kafka" {
  user = aws_iam_user.kafka.name
}

resource "aws_iam_user_policy" "kafka_up" {
  name = "new_policy"
  user = aws_iam_user.kafka.name
policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}