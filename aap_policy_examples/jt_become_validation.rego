package aap_policy_examples

import rego.v1

jt_become := object.get(input, ["job_template","privilege_escalation"], "")

# Default policy response indicating allowed status with no violations
default jt_become_validation := {
	"allowed": true,
	"violations": [sprintf("Value of privilege_escalation '%v'",[jt_become])],
}

# Validate that job template name has correct organization and project name prefixes
jt_become_validation := result if {
	
	# Check if become is true
	jt_become == true

	result := {
		"allowed": false,
		"violations": [sprintf("Become not allowed '%v' does not comply with standards", [jt_become])],
	}
}