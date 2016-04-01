resource "aws_iam_policy" "cloudwatch_read_access" {
	name = "cloudwatch_read_access"
	description = "cloudwatch_read_access"
	path = "/"
	policy = <<POLICY
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Action": [
				"autoscaling:Describe*",
				"cloudwatch:Describe*",
				"cloudwatch:Get*",
				"cloudwatch:List*",
				"logs:Get*",
				"logs:Describe*",
				"logs:TestMetricFilter",
				"sns:Get*",
				"sns:List*"
			],
			"Effect": "Allow",
			"Resource": "*"
		}
	]
}
POLICY
}

resource "aws_iam_user" "monitor_fluentd_cloudwatch" {
	name = "monitor_fluentd_cloudwatch"
}

resource "aws_iam_policy_attachment" "cloudwatch_read_access_attach" {
	name = "cloudwatch_read_access_attach"
	users = ["${aws_iam_user.monitor_fluentd_cloudwatch.name}"]
	policy_arn = "${aws_iam_policy.cloudwatch_read_access.arn}"
}
