output "instance_id" {
  value = aws_instance.ec2_instance.id
  
}
output "public_ip_address" {
  value = aws_instance.ec2_instance.public_ip
  
}
output "network_interface_id" {
    value = aws_network_interface.network_interface[*]
    
}

