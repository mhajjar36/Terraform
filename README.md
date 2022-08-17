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

  ami           = "ami-052efd3df9dad4825"
  
  instance_type = "t2.micro"
  
  }


ex1.)

resource "aws_iam_access_key" "default" {
  
  user = aws_iam_user.default.name

}



ex2.)

resource "aws_iam_user" "default" {
 
 name = local.config.general.iam-username

}






Command to Run your project
---------------------------
>>> getawstempcredentials

this gives us access to the aws account that you wish to upload to

>>> terraform init 

this initializes and downloads the provider plug-ins, in this case aws plug-ins are being initialized

>>> terraform plan

this is a dry run to make sure you wont break anything in your code

>>> terraform apply 


>>> terraform destroy

destroys what you created as to not waste resources $$$

this runs your code type yes to accept
