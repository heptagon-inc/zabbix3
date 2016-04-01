resource "aws_iam_policy" "lambda_execution_kms" {
	name = "lambda_execution_kms"
	description = "lambda_execution_kms"
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
			"Resource": [
				"arn:aws:logs:*:*:*"
			]
		},
		{
			"Effect": "Allow",
			"Action": [
				"kms:Decrypt"
			],
			"Resource": [
				"arn:aws:kms:ap-northeast-1:${var.aws_account_id}:key/*"
			]
		}
	]
}
POLICY
}

resource "aws_iam_role" "lambda_execution_kms" {
	name = "lambda_execution_kms"
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

resource "aws_iam_policy_attachment" "lambda_execution_kms_attachment" {
    name = "lambda_execution_kms_attachment"
    roles = ["${aws_iam_role.lambda_execution_kms.name}"]
    policy_arn = "${aws_iam_policy.lambda_execution_kms.arn}"
}
