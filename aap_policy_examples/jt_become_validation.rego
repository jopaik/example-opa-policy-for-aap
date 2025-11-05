package aap_policy_examples

import rego.v1

default become_false := {
	"allowed": true,
	"violations": [],
}

become_false := {
	"allowed": false,
	"violations": ["Become user is not allow to launch jobs"],
} if {
	input.become_enabled == true
}
