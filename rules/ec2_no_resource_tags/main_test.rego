package rules

import data.lib
import data.lib.testing

test_ec2_no_resource_tags {
	# array containing test cases where the rule is allowed
	allowed_test_cases := [{
		"want_msgs": [],
		"fixture": "allowed-plan.json",
	}]

	# array containing cases where the rule is denied
	denied_test_cases := [{
		"want_msgs": ["input.resource.aws_instance[web].tags"], # verifies that the correct msg is returned by the denied rule
		"fixture": "denied-plan.json",
	}]

	test_cases := array.concat(allowed_test_cases, denied_test_cases)
	testing.evaluate_test_cases("ec2_no_resource_tags", "./rules/ec2_no_resource_tags/fixtures", test_cases)
}
