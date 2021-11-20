package test

import (
	"testing"

	"regexp"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

var projectIdRegex *regexp.Regexp = regexp.MustCompile(`^\S{24}$`)

// Test Atlas Project Terraform module using examples/simple-project using Terratest.
func TestSimpleTerraformAtlasProjectExample(t *testing.T) {
	t.Parallel()

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		//Set the path to the Terraform code that will be tested.
		TerraformDir: "../examples/simple-project",

		// Disable colors in Terraform commands so its easier to parse stdout/stderr
		NoColor: true,
	})

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the values of output variables
	projIdOutput := terraform.Output(t, terraformOptions, "project_id")

	projIdMatch := projectIdRegex.MatchString(projIdOutput)

	// Verify we're getting back the outputs we expect
	assert.Equal(t, projIdMatch, true)
}
