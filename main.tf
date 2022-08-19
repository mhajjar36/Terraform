terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

provider "aws" {

region = "us-east-1"

}




resource "aws_iam_user" "miketest" {
  name = "miketest"

  tags = {
    tag-key = "miketest"
  }
}

resource "aws_iam_access_key" "mikeaccess" {
  user = aws_iam_user.miketest.name
}

resource "aws_iam_user_policy" "mikepolicy" {
  name = "mikepolicy"
  user = aws_iam_user.miketest.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
          "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}


output "iam_user_name" {
value = aws_iam_user.miketest.name
}

output "iam_user_id" {
value = aws_iam_user.miketest.id
}

output "iam_access_key" {
value = aws_iam_access_key.mikeaccess.secret
sensitive = true
}

output "iam_policy" {
 value = aws_iam_user_policy.mikepolicy.policy
  
}