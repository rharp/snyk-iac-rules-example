package rules

deny[msg] {
	resource := input.resource.aws_instance[name]
	name == "web"
	msg := {
		"publicId": "ec2_protected_resource",
		"title": "Resource is Not Allowed to be Modified",
		"severity": "critical",
		"issue": "Resource is not allowed to be modified",
		"impact": "Could affect production resources",
		"remediation": "Do not modify",
		"msg": sprintf("input.resource.aws_instance[%s]", [name]),
		"references": [],
	}
}
