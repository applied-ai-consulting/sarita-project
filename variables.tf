variable "project" {
  description = "Project or organisation name"
  type        = string
  default     = ""
}

variable "environment" {
  description = "Application environment name (dev/prod/qa)"
  type        = string
  default     = ""
}

variable "username" {
  description = "Name of the user"
  type        = string
  default     = ""
}

variable "aws_region" {
  description = "AWS region where all the resources are going to create"
  type        = string
  default     = ""
}

# variable "versioning" {
#   type        = string
#   description = "Either you want to enable versioning for S3 bucket or not"
#   default     = ""
# }

# variable "acl" {
#   type        = string
#   description = "It defines which AWS accounts or groups are granted access and the type of access"
#   default     = ""
# }

variable "domain_name" {
  type        = string
  description = "The domain name for the website"
  default     = ""
}

variable "bucket_name" {
  type        = string
  description = "The name of the bucket without the www. prefix(normally domain_name)"
  default     = ""
}

# variable "validation_method" {
#   type        = string
#   description = "Give validation method to validate the ssl certificate(DNS or EMAIL)"
#   default     = ""
# }


