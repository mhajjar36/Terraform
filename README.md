# Terraform_Learning


Naming a Resource
------------------------

resource "provider_resource_type" "name" {
  
  key = "value"
  
  key2 = "anothervalue"

}


provider = aws, azure etc

resource_type -> get this from the left hand resources side https://registry.terraform.io/providers/hashicorp/aws/latest/docs

name = you can name this whatever you want

<img width="342" alt="image" src="https://user-images.githubusercontent.com/107702633/185225341-b6c71de0-961e-414e-b216-5a1e6e9b434a.png">

Example, I want to run an aws EC2 instance


<img width="1171" alt="image" src="https://user-images.githubusercontent.com/107702633/185227230-3bd0d07c-2ec8-430f-93fc-be6aac40d82e.png">



We dont need to copy the tags

copy this into your main.tf file

resource "aws_instance" "my-first-project" {

  ami           = "ami-0864786f78543579fce1"
  
  instance_type = "t3.micro"
  
  }


ex1.)

resource "aws_iam_access_key" "default" {
  
  user = aws_iam_user.default.name

}



ex2.)

resource "aws_iam_user" "default" {
 
 name = local.config.general.iam-username

}
