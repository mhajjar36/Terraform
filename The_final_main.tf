
#Subsititute for provider and region name
terraform {
  required_version = ">= 1.0.0"

required_providers {
    aws = {
        source  = "hashicorp/aws"
        version = ">= 4.0"
        }
        }
}

resource "aws_iam_user" "ticket" {
    name = "kafka_tiered_storage"
}

#this is an access key needed to allow API requests
resource "aws_iam_access_key" "ticket" {
    user = aws_iam_user.ticket.name
}

output "secret" {
    value = aws_iam_access_key.ticket.secret
    sensitive = true
}

output "access_key_id" {
    value = aws_iam_access_key.ticket.id
}

#user policy with permissions
resource "aws_iam_user_policy" "ticket" {
    name = "kafka_access"
    user = aws_iam_user.ticket.name
    
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
