# Amazon S3 website

## overview

This module is responsible for creating a website hosted on Amazon S3 with a customize DNS name.

# Requirements

| Name | Version |
|------|---------|
| terraform |	>= 1.0 |
| aws |	>= 3.50 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 3.50 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws_region | Name of AWS region in which you want to create resources | `string` | "" | yes |
| project | Name of the project | `string` | "" | yes |
| environment | Name of the application environment(dev/prod/qa) | `string` | "" | yes |
| username | Name of the user who is deploying the resources | `string` | "" | yes |
| versioning | Either you want to enable versioning for S3 bucket or not | `bool` | false | no |
| acl | It defines which AWS accounts or groups are granted access and the type of access | `string` | public-read | no |
| domain_name | The domain name for the website | `string` | "" | yes |
| bucket_name | The name of the bucket without the www. prefix(normally domain_name) | `string` | "" | yes | no |
| validation_method | Give validation method to validate the ssl certificate(DNS or EMAIL) | `string` | "" | yes |




## Outputs
| Name | Description |
|------|-------------|
| www_s3_bucket_name | Name of the bucket starting with www prefix |
| root_s3_bucket_name | Name of the bucket starting without any prefix |
| www_cloudfront_domain_name | Domain name of the cloudfront distribution having origin as S3 bucket with www prefix |
| root_cloudfront_domain_name | Domain name of the cloudfront distribution having origin as S3 bucket without any prefix |
| ssl_certificate_status | Status of the ssl certificate |
| ssl_certificate_arn | ARN of the ssl certificate |


## resource

https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy

## Prerequisites for terratest and HTML report generation


1. Add values infront of keys in terraform `vars.tfvars` file

## To run terratest

please go through the below steps:
``` 
step 1: Terratest uses the Go   testing framework. To use Terratest, you need to install:
            `Go (requires version >=1.13)`

step 2 : To configure dependencies, run:
        cd Test
        go mod init test
        go mod tidy      //Required to download go.mod & go.sum files.//

step 3: To run the tests:
        go test -timeout 30m -v filename_test.go
```        

### ----------------------OR-------------------------

## To run terratest and generate html report

step 1: Create pom.xml file in test folder.

step 2: Install [maven](https://maven.apache.org/install.html)

step 3: Run the `mvn test` command in  the test directory. This `mvn test` command will run the terrtest go file and will generate report in html format.
