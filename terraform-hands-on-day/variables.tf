# region variable
variable "aws_region" {
    description = "region value"
    type = string
    default = "us-east-1"
}

# vpc cidr block variable
variable "vpc_cidr_block" {
    description = "vpc network id"
    type = string
    default = "10.0.0.0/16"
}

# public subnet cidr block variable
variable "pub_sub1_cidr_block" {
    description = "vpc network id"
    type = string
    default = "10.0.0.0/24"
  
}

# private subnet cidr block variable
variable "priv_sub1_cidr_block" {
    description = "vpc network id"
    type = string
    default = "10.0.1.0/24"
  
}

variable "aws_instance_type" {
    description = "instance type"
    type = string
    default = "t2.micro"
}

variable "instance_key_pair" {
    description = "instance key"
    type = string
    default = "narcisse-keypair"
}    