# output information about aws resources

output "vpc" {
  description = "display vpc id"
  value       = module.vpc.vpc_id

}

output "security-group" {
  description = "security group id for the bastion host server"
  value       = module.security-group.security_group_id

}

output "security-group-private-instance" {
  description = "security group id for the private subnet instance"
  value       = module.security-group-private-instance.security_group_id

}