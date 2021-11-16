# Input variables

# AWS region variable
variable "aws_region" {
  description = "region value"
  type        = string
  default     = "us-east-1"
}

# VPC Name 
variable "vpc_name" {
  description = "VPC name"
  type        = string

}

# VPC cidr block
variable "vpc_cidr_block" {
  description = "VPC cidr block"
  type        = string
}

# VPC availability Zones 
variable "vpc_availabilty_zones" {
  description = "VPC availabilty zones"
  type        = list(string)
}

# VPC public subnets
variable "vpc_public_subnets" {
  description = "VPC public subnets"
  type        = list(string)
}

# VPC private subnets 
variable "vpc_private_subnets" {
  description = "VPC private subnets"
  type        = list(string)
}

# VPC Database subnets
variable "vpc_database_subnets" {
  description = "VPC Database subnets"
  type        = list(string)
}

# VPC create database subnet group 
variable "vpc_create_database_subnet_group" {
  description = "VPC Create Database subnet group"
  type        = bool
}

# VPC create database subnet route table 
variable "vpc_create_database_subnet_route_table" {
  description = "VPC Create Database subnet route table"
  type        = bool
}

# VPC enable NAT Gateway 
variable "vpc_enable_nat_gateway" {
  description = "Enable NAT Gateway for private subnets Outbound communication"
  type        = bool
}

# VPC single NAT gateway 
variable "vpc_single_nat_gateway" {
  description = "Enable only single NAT Gateway in one Availability Zone to save cost"
  type        = bool
}

# bastion security group ingress cidr block
variable "ingress_cidr_block"{
    description = "ingress cidr block for the bastion security group"
    type = list(string)
}

# add monitoring using cloudwatch
variable "ec2_monitoring" {
  description = "use Cloudwatch to monotor ec2"
  type        = bool
}

# instance key pair
variable "instance_key_pair"{
  description = "instance key pair"
  type        = string
}

# instance type
variable "instance_type_map"{
  description = "type of instance used"
  type        = map(string)
}

variable "instance_count1"{
  description = "number of instance"
  type = number
  default = 1
}