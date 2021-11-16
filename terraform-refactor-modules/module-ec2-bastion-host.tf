# Use the ec2 module to deploy a bastion host in public subnet availability zone 2

module "ec2-instance" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "my-bastion-server"
  instance_count         = var.instance_count1

  ami                    = data.aws_ami.amazon-linux-2.id 
  instance_type          =  var.instance_type_map["qa"]
  key_name               = var.instance_key_pair
  monitoring             = var.ec2_monitoring
  vpc_security_group_ids = [module.security-group.security_group_id]
  subnet_id              = module.vpc.public_subnets[1]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}