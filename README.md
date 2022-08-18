# Terraform_Learning


Naming and Setting Up a Resource
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


Main.tf
-------------------------------

provider "aws" {

region = "us-east-1"

}


Output.tf
--------------------------------

Output values are similar to return values in programming languages 

What do we want to output?

Syntax

output followed by an identifier

ex 1.)

output "instance_ip_addr" {

  value = aws_instance.server.private_ip
  
}

ex 2.)

output access_key_id {

    value = aws_iam_access_key.default.id
    
    sensitive = true
}

ex 3.)

output access_key_secret {

    value = aws_iam_access_key.default.secret
    
    sensitive = true
}

ex 4.)

output "vpc_id" {

  description = "ID of the vpc"    #adding a description is optional but good practice
  
  value       = module.aws_web_server_vpc.vpc_id
  
}
 
 ex 5.)
 
output "instance_id" {

  description = "ID of EC2 instance"
  
  value       = module.aws_web_server_instance.instance_id
  
}
 
 ex 6.)
 
 output "bucket-name" {
 
  value = aws_s3_bucket.bucket.id
  
}


Variables.tf
---------------------

ex 1.)

variable "instance_name" {

  description = "Value of the Name tag for the EC2 instance"
  
  type        = string
  
  default     = "ExampleAppServerInstance"
  
}

ex 2.)

variable "name" {

    type = any
    
    default = {}
    
}

ex 3.)

variable "access_key_id" {

    type = any
    
    default = {}
    
}

ex 4.)

variable "access_key_secret" {

    type = any
    
    default = {}
    
}

ex 5.)

variable "aws_region" {

  description = "AWS region"
  
  type        = string
  
}
 
 ex 6.)
 
variable "ec2_instance_type" {

  description = "Instance type for EC2 instances"
  
  type        = string
  
  default     = "t2.small"
  
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
