# Terraform_Learning


Naming a Resource
------------------------

resource "provider_resource_type" "name" {
  
  key = "value"
  
  key2 = "anothervalue"

}

ex1.)

resource "aws_iam_access_key" "default" {
  user = aws_iam_user.default.name
}



ex2.)

resource "aws_iam_user" "default" {
  name = local.config.general.iam-username
}
