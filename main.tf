
# create a vpc with cidr=10.0.0.0/16. Enable dns support and host name and tag it "terra-vpc"
resource "aws_vpc" "terra-vpc" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "terra-vpc"
  }
}

# create an IGW an attach it to the vpc
resource "aws_internet_gateway" "terra-igw" {
  vpc_id = aws_vpc.terra-vpc.id

  tags = {
    Name = "terra-igw"
  }
}



# create one public route table 
resource "aws_route_table" "pub-route-table" {
  vpc_id = aws_vpc.terra-vpc.id

  route  {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.terra-igw.id
    }
  

  tags = {
    Name = "pub-route-table"
  }
}

# create one private route table 
resource "aws_route_table" "priv-route-table" {
  vpc_id = aws_vpc.terra-vpc.id

  tags = {
    Name = "priv-route-table"
  }
}

# create public subnet,  terra-pub-sub1
resource "aws_subnet" "terra-pub-sub1" {
  vpc_id     = aws_vpc.terra-vpc.id
  cidr_block = var.pub_sub1_cidr_block
  availability_zone = "us-east-1a"

  tags = {
    Name = "terra-pub-sub1"
  }
}

# create private subnet,  terra-priv-sub1
resource "aws_subnet" "terra-priv-sub1" {
  vpc_id     = aws_vpc.terra-vpc.id
  cidr_block = var.priv_sub1_cidr_block
  availability_zone = "us-east-1a"

  tags = {
    Name = "terra-priv-sub1"
  }
}

# associate public subnet with public route table
resource "aws_route_table_association" "pub_association" {
  subnet_id      = aws_subnet.terra-pub-sub1.id
  route_table_id = aws_route_table.pub-route-table.id
}

# associate private subnet with private route table
resource "aws_route_table_association" "priv_association" {
  subnet_id      = aws_subnet.terra-priv-sub1.id
  route_table_id = aws_route_table.priv-route-table.id
}  

# create one sceurity group that allows port 80 and 22.
resource "aws_security_group" "terra-web-sg" {
  name        = "terra-web-sg"
  description = "Allow web and ssh traffic"
  vpc_id      = aws_vpc.terra-vpc.id

  ingress {
      description      = "HTTP TRAFFIC"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }
  ingress {
      description      = "SSH TRAFFIC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }
egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
    }
  

  tags = {
    Name = "allow_web_ssh_traffic"
  }
}

# deploy an EC2 instance in pub-sub1 referencing the AMI fetched above and a key-pair from your account

resource "aws_instance" "pub-sub1-instance" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = var.aws_instance_type
  key_name = var.instance_key_pair
  associate_public_ip_address = true
  subnet_id = aws_subnet.terra-pub-sub1.id
  security_groups = [ aws_security_group.terra-web-sg.id ]

  tags = {
    Name = "pub-sub1-instance"
  }
}

# deploy an EC2 instance in priv-sub1 referencing the AMI fetched above and a key-pair from your account

resource "aws_instance" "priv-sub1-instance" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = var.aws_instance_type
  key_name = var.instance_key_pair
  subnet_id = aws_subnet.terra-priv-sub1.id
  security_groups = [ aws_security_group.terra-web-sg.id ]

  tags = {
    Name = "priv-sub1-instance"
  }
}