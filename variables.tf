variable "region" {
  description = "AWS region"
  type        = string

}
variable "project" {
  description = "Project or organisation name"
  type        = string
  
}
 variable "environment" {
  description = "Application environment name (dev/prod/qa)"
  type        = string
}
 variable "username" {
  description = "name of the user"
  type        = string

}
 variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = ""
  
}
 variable "ami" {
  description = "ID of AMI to use for the instance"
  type        = string
  
}
 variable "monitoring" {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled"
  type        = bool
  default     = false
  
}
variable "key_name" {
    description = "Key name of the Key Pair to use for the instance; which can be managed using the aws_key_pair resource"
    type        = string
    
}
variable "vpc_security_group_id" {
  description = "The VPC ID to launch in"
  type        = list(any)
  
}
variable"subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = string
  
}
variable "security_group_id" {
  description = "A list of security group IDs to associate with"
  type        = list(any)
  
}
variable "number_of_count" {
  description = "count for number of ip address"
  type        =  number
  
}

variable "subnet_mapping" {
  description = "Subnet ids mapping to have individual firewall endpoint"
  type        = list(string)
}


variable "rule_groups" {
  type        = any
  description = "Rule groups to use in network firewall"
}



variable "name" {
  type        = string
  description = "Firewall name"
}

variable "prefix" {
  description = "The descriptio for each environment, ie: bin-dev"
  type        = string
}

variable "description" {
  description = "Description for the resources"
  default     = ""
  type        = string
}

variable "fivetuple_stateful_rule_group" {
  description = "Config for 5-tuple type stateful rule group"
  default     = []
  type        = any
}

variable "vpc_id" {
  type        = string
  description = "Vpc id in which firewall will be created"
}


variable "stateless_default_actions" {
  type        = list(string)
  description = "Stateless default action"
  default     = ["aws:forward_to_sfe"]
}

variable "stateless_fragment_default_actions" {
  type        = list(string)
  description = "Stateless fragment default actions"
  default     = ["aws:forward_to_sfe"]
}

variable "logging_configuration" {
  type        = any
  description = "Logging configuration"
  default     = []
}

variable "tags" {
  type        = map(any)
  description = "Tags for all resources"
  default     = {}
}

variable "rule_group_id" {
type  = string
description = "stateful rule group id"
}