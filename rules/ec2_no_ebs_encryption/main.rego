package rules

deny[msg] {
	resource := input.resource.aws_instance[name]
	not resource.ebs_block_device[0].encrypted = true
	msg := {
		"publicId": "ec2_no_ebs_encryption",
		"title": "No EBS Volume Encryption on Ec2 Instance",
		"severity": "critical",
		"issue": "No EBS Volume Encryption on Ec2 Instance",
		"impact": "Data is vulnerable",
		"remediation": "Add section for `ebs_block_device = {  }` with encryption set to true.",
		"msg": sprintf("input.resource.aws_instance[%s].ebs_block_device[0].encrypted", [name]),
		"references": [],
	}
}
