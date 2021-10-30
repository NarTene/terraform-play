#
output "pub-sub1-instance_ip_addr" {
  value       = aws_instance.pub-sub1-instance.private_ip
  description = "The private IP address of the server instance in the public subnet."
}