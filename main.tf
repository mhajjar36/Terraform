
# main.tf
# way to setup iam user is shwon here https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user
resource "aws_iam_user" "testuser" {
  name = "testuser"

  tags = {
    tag-key = "test-user-tag"
  }
}

resource "aws_iam_access_key" "testuser_access" {
  user = aws_iam_user.testuser.name
}

#user policy with permissions
resource "aws_iam_user_policy" "testuser_policy" {
    name = "testuser_policy_test"
    user = aws_iam_user.testuser.name
    
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
    {
    "Action": [
        "s3:DeleteObject",
        "s3:GetObject",
        "s3:GetBucketLocation",
        "s3:PutObject",
        "s3:AbortMultipartUpload"
    ],
    "Effect": "Allow",
    "Resource": [
        "arn:aws:s3:::s3-topic-sbox/*",
        "arn:aws:s3:::s3-topic-dev/*"
    ]
    }
]
}
EOF
}
