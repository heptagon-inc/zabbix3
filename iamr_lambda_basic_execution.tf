resource "aws_iam_policy" "lambda_basic_execution" {
	name = "lambda_basic_execution"
	description = "lambda_basic_execution"
	policy = <<POLICY
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Effect": "Allow",
			"Action": [
				"logs:CreateLogGroup",
				"logs:CreateLogStream",
				"logs:PutLogEvents"
			],
			"Resource": "arn:aws:logs:*:*:*"
		}
	]
}
POLICY
}

resource "aws_iam_role" "lambda_basic_execution" {
	name = "lambda_basic_execution"
	assume_role_policy = <<POLICY
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "",
			"Effect": "Allow",
			"Principal": {
				"Service": "lambda.amazonaws.com"
			},
			"Action": "sts:AssumeRole"
		}
	]
}
POLICY
}

resource "aws_iam_policy_attachment" "lambda_basic_execution_attachment" {
    name = "lambda_basic_execution_attachment"
    roles = ["${aws_iam_role.lambda_basic_execution.name}"]
    policy_arn = "${aws_iam_policy.lambda_basic_execution.arn}"
}
