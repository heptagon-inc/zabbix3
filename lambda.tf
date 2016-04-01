// aws lambda is not control by terraform

/*
resource "aws_lambda_function" "zabbix_alert_stop" {
	depends_on = ["aws_iam_role.lambda_execution_kms"]
	filename = "lambda_functions/zabbix_alert_stop/zabbix_alert_stop.zip"
	function_name = "zabbix_alert_stop"
	description = "zabbix_alert_stop"
	role = "${aws_iam_role.lambda_execution_kms.arn}"
	handler = "lambda_function.lambda_handler"
	runtime = "python2.7"
	timeout = 10
}
*/

#resource "aws_lambda_permission" "zabbix_alert_stop_permission" {
#	statement_id = "AllowExecutionFromAPIGateway"
#	action = "lambda:InvokeFunction"
#	function_name = "${aws_lambda_function.zabbix_alert_stop.arn}"
#	principal = "apigateway.amazonaws.com"
#	source_arn = "arn:aws:execute-api:ap-northeast-1:${var.aws_account_id}:${aws_api_gateway_rest_api.zabbix_alert_stop_api.root_resource_id}/*/GET/*"
#}
