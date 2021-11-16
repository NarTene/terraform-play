# create a vpc using a module



module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.78.0"

  name = "my-vpc"
  cidr = var.vpc_cidr_block

  azs             = var.vpc_availabilty_zones
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  # create database subnets

  database_subnets                   = var.vpc_database_subnets
  create_database_subnet_group       = var.vpc_create_database_subnet_group
  create_database_subnet_route_table = var.vpc_create_database_subnet_route_table
  enable_dns_hostnames               = true
  enable_dns_support                 = true

  # single NAT gateway
  enable_nat_gateway     = var.vpc_enable_nat_gateway
  single_nat_gateway     = var.vpc_single_nat_gateway
  one_nat_gateway_per_az = false



  # tags section
  database_subnet_tags = {
    Type = "database-subnets"
  }
  public_subnet_tags = {
    Type = "public-subnets"
  }

  private_subnet_tags = {
    Type = "private-subnets"
  }

  tags = {
    Owner       = "narcisse"
    Environment = "dev"
  }
  vpc_tags = {
    Name = "my-vpc"
  }
}