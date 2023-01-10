resource "aws_instance" "ec2_instance" {

 ami                    = var.ami    
 instance_type          = var.instance_type
 key_name               = var.key_name
 monitoring             = var.monitoring
 subnet_id              = var.subnet_id
 vpc_security_group_ids = var.vpc_security_group_id
    
 tags = {
   Name = format("%v-%v-instance", var.project, var.environment)   
 }
}

resource "aws_network_interface" "network_interface" {
  count = var.number_of_count
  subnet_id   = var.subnet_id
  security_groups = var.security_group_id
  attachment{
  instance = aws_instance.ec2_instance.id
  device_index = count.index + 1
  } 
}
