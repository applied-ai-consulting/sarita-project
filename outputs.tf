output "www_cloudfront_domain_name" {
  description = "Domain name of the cloudfront distribution having origin as S3 bucket with www prefix"
  value       = aws_cloudfront_distribution.www_s3_distribution.domain_name
}

# output "root_cloudfront_domain_name" {
#   description = "Domain name of the cloudfront distribution having origin as S3 bucket without any prefix"
#   value       = aws_cloudfront_distribution.root_s3_distribution.domain_name
# }

output "www_s3_bucket_name" {
  description = "Name of the bucket starting with www prefix"
  value       = aws_s3_bucket.www_bucket.id
}

# output "root_s3_bucket_name" {
#   description = "Name of the bucket starting without any prefix"
#   value       = aws_s3_bucket.www_bucket.id
# }

# output "ssl_certificate_status" {
#   description = "Status of the ssl certificate"
#   value       = aws_acm_certificate.ssl_certificate.status
# }

# output "ssl_certificate_arn" {
#   description = "ARN of the ssl certificate"
#   value       = aws_acm_certificate.ssl_certificate.arn
# }

