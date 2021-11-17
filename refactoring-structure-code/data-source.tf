# Use this data source to get an Amazon linux 2 AMI.
data "aws_ami" "amazon-linux-2" {
  most_recent      = true
  owners           = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }

}
