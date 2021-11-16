# Ec2 instance to use user data to display your name on Apache

module "ec2-instance-user-data" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "my-private-server"
  instance_count         = var.instance_count1

  ami                    = data.aws_ami.amazon-linux-2.id 
  instance_type          =   var.instance_type_map["qa"] 
  key_name               = var.instance_key_pair   
  monitoring             = var.ec2_monitoring
  vpc_security_group_ids = [module.security-group-private-instance.security_group_id]
  subnet_id              = module.vpc.private_subnets[1]

  user_data             = file("install-apache.sh")

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}