# versions.tf
terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}


# provider.tf
provider "aws" {
region = "us-east-1"
}



# main.tf
# way to setup iam user is shwon here https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user
resource "aws_iam_user" "miketest" {
  name = "miketest"

  tags = {
    tag-key = "miketest"
  }
}

resource "aws_iam_access_key" "mikeaccess" {
  user = aws_iam_user.miketest.name
}

#user policy with permissions
resource "aws_iam_user_policy" "mike_policy" {
    name = "mike_policy_test"
    user = aws_iam_user.miketest.name
    
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


# getawstempcredentials
# terraform init
# terraform validate
# terraform plan
# terraform apply
# terraform destroy
