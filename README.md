# Terraform_Learning


Naming a Resource
------------------------
provider = aws, azure etc

resource_type -> get this from the left hand side https://registry.terraform.io/providers/hashicorp/aws/latest/docs

Dont use data types only resource types

<img width="342" alt="image" src="https://user-images.githubusercontent.com/107702633/185225341-b6c71de0-961e-414e-b216-5a1e6e9b434a.png">



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
