package aap_policy_examples

import rego.v1

default become_false := {
	"allowed": true,
	"violations": [],
}

become_false := result if {
	# get become_enabled
	input_become := object.get(input, ["become_enabled"], {})

	# check if become is true
	input_become == true

	result := {
		"allowed": false,
		"violations": [sprintf("Become run not allowed", [])],
	}
}
