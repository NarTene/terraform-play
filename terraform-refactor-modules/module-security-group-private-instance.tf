# security group module for the instance in the private subnet  

module "security-group-private-instance" {
  source = "terraform-aws-modules/security-group/aws"
  version = "4.4.0"


  name        = "private-instance-sg"
  description = "Security group for user-service with custom ports open within VPC"
  vpc_id      = module.vpc.vpc_id
  

  ingress_cidr_blocks      = var.ingress_cidr_block
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "User-service ports"
      cidr_blocks = var.vpc_cidr_block
    },

    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "User-service ports"
      cidr_blocks = var.vpc_cidr_block
    },
  ]
}