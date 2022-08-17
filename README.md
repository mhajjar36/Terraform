# Terraform_Learning


Naming a Resource
------------------------

resource "provider_resource_type" "name" {
  
  key = "value"
  
  key2 = "anothervalue"

}


provider = aws, azure etc

resource_type -> get this from the left hand resources side https://registry.terraform.io/providers/hashicorp/aws/latest/docs



<img width="342" alt="image" src="https://user-images.githubusercontent.com/107702633/185225341-b6c71de0-961e-414e-b216-5a1e6e9b434a.png">

Example, I want to run an aws EC2 instance

<img width="363" alt="image" src="https://user-images.githubusercontent.com/107702633/185226322-1502249b-19af-4e71-937a-63feafe0169e.png">





ex1.)

resource "aws_iam_access_key" "default" {
  
  user = aws_iam_user.default.name

}



ex2.)

resource "aws_iam_user" "default" {
 
 name = local.config.general.iam-username

}
