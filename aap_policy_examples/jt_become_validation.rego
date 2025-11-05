package aap_policy_examples

import rego.v1

# Default policy response indicating allowed status with no violations
default jt_become_validation := {
	"allowed": true,
	"violations": [],
}

# Validate that job template name has correct organization and project name prefixes
jt_become_validation := result if {

	# Check jt_become
	input.job_template.become_enabled == true

	result := {
		"allowed": false,
		"violations": [sprintf("Become not allowed '%v' does not comply with standards", [jt_become])],
	}
}