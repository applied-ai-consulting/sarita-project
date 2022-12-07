# S3 bucket for website
resource "aws_s3_bucket" "www_bucket" {
  bucket = "www.${var.bucket_name}"
  #acl    = "public-read"
  #policy = templatefile("templates/s3-policy.json", { bucket = "www.${var.bucket_name}" })
}

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.www_bucket.id
  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}

data "aws_iam_policy_document" "allow_access_from_another_account" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.www_bucket.arn,
      "${aws_s3_bucket.www_bucket.arn}/*",
    ]
  }
}

resource "aws_s3_bucket_cors_configuration" "CorsEx" {
  bucket = "www.${var.bucket_name}"
  cors_rule {
    allowed_headers = ["Authorization", "Content-Length"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["https://www.${var.domain_name}"]
    max_age_seconds = 3000
  }
}

resource "aws_s3_bucket_acl" "ACLEx" {
  bucket = "www.${var.bucket_name}"
  acl    = "public-read"
}

# resource "aws_s3_bucket_versioning" "versioning_example" {
#   bucket = "www.${var.bucket_name}"
#   versioning_configuration {
#     status = "Enabled"
#   }
# }

resource "aws_s3_bucket_website_configuration" "WebConfig" {
  bucket = "www.${var.bucket_name}"
  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  routing_rule {
    condition {
      key_prefix_equals = "docs/"
    }
    redirect {
      replace_key_prefix_with = "documents/"
    }
  }
}
 