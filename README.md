# Terraform_Learning


## Naming and Setting Up a Resource in main.tf



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



Syntax

resource "provider_resource_type" "name" {
  
  value = "anothervalue"
  
  value2 = provider_resource_type.name.attribute_reference
  
  value3 = 100215

}


ex.)


resource "aws_iam_user" "tf_learning" {

  name = "kafka-tiered-storage"
  
}



resource "aws_iam_access_key" "default" {

  user = aws_iam_user.tf_learning.name
  
}




  

## Main.tf

  This is where you define all your resources
  
  
  
  
 



## Output.tf


Output values are similar to return values in programming languages 

What do we want to output to the command line?

https://registry.terraform.io/providers/hashicorp/aws/latest/docs

Select the resouce you want on the left hand side

scroll down to Attributes Reference, this is what you put at the end of your output

<img width="674" alt="image" src="https://user-images.githubusercontent.com/107702633/185460531-01f28691-0785-4806-99a3-0e5685f6ca5f.png">


in main.tf

resource "aws_instance" "web" {

ami = "ami-0007865644fc68d453"

instance_type = "t2.micro"

}

TO OUPTUT THE VALUE RETURNED BY THIS RESOURCE TO COMMAND LINE

in output.tf

output "give_me_a_name" {

value = aws_instance.web.public_ip           

# .public_ip is gotten from attributes reference on terraform 

website

}



Syntax

output "give_any_name_here" {

value = provider_resource_type.name.attributes_reference.   

#provider_resource_type.name is gotten from a resource type defined in main.tf

}

<img width="213" alt="image" src="https://user-images.githubusercontent.com/107702633/185457670-fa1f0e50-bca3-4d9c-9a3b-ad7b4855a553.png">


<img width="656" alt="image" src="https://user-images.githubusercontent.com/107702633/185457773-e20fde3f-fb13-4c4f-9e33-71e4efa64bc7.png">















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


## Variables.tf


variable "name" {

type = string, number or bool

default = default value if not specified

}


ex 1.)

variable "instance_name" {

  description = "Value of the Name tag for the EC2 instance"
  
  type        = string
  
  default     = "ExampleAppServerInstance"
  
}

To reference this variable in main.tf use

var.instance_name

ex in main.tf 

Name = var.instance_name



Variables.tf
<img width="329" alt="image" src="https://user-images.githubusercontent.com/107702633/185439003-248ce400-b472-41ed-99e2-dfa4e00328d9.png">

main.tf

<img width="277" alt="image" src="https://user-images.githubusercontent.com/107702633/185439116-1e5287c5-f925-4ad1-b4a9-797213e4e19f.png">



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
  
  default     = "us-east-1"
  
}
 
 ex 6.)
 
variable "ec2_instance_type" {

  description = "Instance type for EC2 instances"
  
  type        = string
  
  default     = "t2.small"
  
}

ex 7.)

variable "template" {

  type = string
  
  default = "01000000-0000-4000-8000-000030080200"
  
}

ex 8.)

variable "users" {

  type    = list
  
  default = ["root", "user1", "user2"]
  
}

ex 9.)

variable "ec2_instance_type" {

type = string

default = "t3.micro"

}

## Provider.tf


provider "aws" {

  region  = "us-east-1"

  #You can use access keys
  
  access_key = var.aws_access_key
  
  secret_key = var.aws_secret_key

}
  
  
ex .)
  
  provider "aws" {

region = "us-east-1"

}
  
  
  
## Versions.tf

  
  terraform {
  
  required_version = ">= 1.0.0"

  required_providers {
  
    aws = {
    
      source  = "hashicorp/aws"
      
      version = ">= 4.0"
      
    }
    
  }
  
}

## Command to Run your project

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
