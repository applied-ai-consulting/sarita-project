package test

import (  
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerratestAWSEc2MultiIP(t *testing.T) {
	t.Parallel()

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// website::tag::1::Set the path to the Terraform code that will be tested.
		TerraformDir: "../../amazon_ec2_with_multiple_dynamic_ip_addresses_in_an_existing_vpc",

		// Variables to pass to our Terraform code using -var-file options
		VarFiles: []string{"vars.tfvars"},
	})

	// website::tag::4::Clean up resources with "terraform destroy". Using "defer" runs the command at the end of the test, whether the test succeeds or fails.
	defer terraform.Destroy(t, terraformOptions)

	// website::tag::2::Run "terraform init" and "terraform apply".
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the values of output variables
	instance_id := terraform.Output(t, terraformOptions, "instance_id")
	public_ip_address := terraform.Output(t, terraformOptions, "public_ip_address")
	network_interface_id := terraform.Output(t, terraformOptions, "network_interface_id")
	

	// Verify we're getting back the outputs we expect
	assert.Contains(t, instance_id, "i-")
	assert.Contains(t, public_ip_address, "")
	assert.Contains(t, network_interface_id, "")
	
}
