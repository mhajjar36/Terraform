
variable "IAM_User_Name" {
description = "User Name for the IAM User"
type = any
default = "kafka_tiered_storage"
}

variable "access_key" {
    description = "Access Key for AWS Account"
    type = any
    default = {}
  
}


variable "secret_access_key" {
    description = "Access Key for AWS Account"
    type = any
    default = {}
  
}