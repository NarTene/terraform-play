The Terraform-refactor-modules leverage different modules to deploy AWS infrastructure as code.
the following module are used:
- VPC module
- EC2 module to deploy a bastion host in public subnet.
- Security group module to deploy a SG for the bastion host.
- Security group module to deploy a SG for the instance in a private subnet.
