package aap_policy_examples

import rego.v1

# Default policy response indicating allowed status with no violations
default jt_become_validation := {
    "allowed": true,
    "violations": [],
}

# Validate that job template name has correct organization and project name prefixes
jt_naming_validation := result if {
    # Extract values from input
    jt_become := object.get(input, ["job_template", "become_enabled"], "")


    # Check if job template name starts with expected prefix
    not jt_become == False

    result := {
        "allowed": false,
        "violations": [sprintf("Job template become enable not allowed and does not comply with standards", [jt_name])]
    }
}
