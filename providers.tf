provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      Environment = var.environment
      ManagedBy   = "Terraform"
      CreatedBy   = var.username
      Project     = var.project
    }
  }
}

#  #To use an ACM certificate with Amazon CloudFront, you must request or import the certificate in the US East (N. Virginia) region.
# provider "aws" {
#   alias  = "acm_provider"
#   region = var.aws_region
# }
