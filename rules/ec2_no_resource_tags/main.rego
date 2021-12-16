package rules

deny[msg] {
	resource := input.resource.aws_instance[name]
	resource.tags == null
	msg := {
		"publicId": "ec2_no_resource_tags",
		"title": "No Resource Tags Defined for AWS Instance",
		"severity": "critical",
		"issue": "No resource tags on aws_instance",
		"impact": "Unable to properly identify resources",
		"remediation": "Add section for `tags = {  }` with relevant tags included.",
		"msg": sprintf("input.resource.aws_instance[%s].tags", [name]),
		"references": [],
	}
}
