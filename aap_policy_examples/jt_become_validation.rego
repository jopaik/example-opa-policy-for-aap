package aap_policy_examples

import rego.v1

default become_false := {
	"allowed": true,
	"violations": [],
}
job_template.become_enabled := false

become_false := {
	"allowed": false,
	"violations": ["Become user is not allow to launch jobs"],
} if {
	input.job_template.become_enabled == true
}