package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerratestAWSS3(t *testing.T) {
	t.Parallel()

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// website::tag::1::Set the path to the Terraform code that will be tested.
		TerraformDir: "../",

		// Variables to pass to our Terraform code using -var-file options
		VarFiles: []string{"vars.tfvars"},
	})

	// website::tag::4::Clean up resources with "terraform destroy". Using "defer" runs the command at the end of the test, whether the test succeeds or fails.
	defer terraform.Destroy(t, terraformOptions)

	// website::tag::2::Run "terraform init" and "terraform apply".
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the values of output variables
	root_cloudfront_domain_name := terraform.Output(t, terraformOptions, "root_cloudfront_domain_name")
	root_s3_bucket_name := terraform.Output(t, terraformOptions, "root_s3_bucket_name")
	ssl_certificate_arn := terraform.Output(t, terraformOptions, "ssl_certificate_arn")
	ssl_certificate_status := terraform.Output(t, terraformOptions, "ssl_certificate_status")
	www_cloudfront_domain_name := terraform.Output(t, terraformOptions, "www_cloudfront_domain_name")
	www_s3_bucket_name := terraform.Output(t, terraformOptions, "www_s3_bucket_name")

	// Verify we're getting back the outputs we expect
	assert.Contains(t, "root_cloudfront_domain_name", root_cloudfront_domain_name)
	assert.Contains(t, "root_s3_bucket_name", root_s3_bucket_name)
	assert.Contains(t, "ssl_certificate_arn", ssl_certificate_arn)
	assert.Contains(t, "ssl_certificate_status ", ssl_certificate_status)
	assert.Contains(t, "www_cloudfront_domain_name", www_cloudfront_domain_name)
	assert.Contains(t, "www_s3_bucket_name", www_s3_bucket_name)

}
