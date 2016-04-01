// api-gateway is not control by terraform

/*
resource "aws_api_gateway_rest_api" "zabbix_alert_stop_api" {
  name = "zabbix_alert_stop_api"
  description = "zabbix_alert_stop_api"
}

resource "aws_api_gateway_resource" "zabbix_alert_stop_api-eventid" {
  rest_api_id = "${aws_api_gateway_rest_api.zabbix_alert_stop_api.id}"
  parent_id = "${aws_api_gateway_rest_api.zabbix_alert_stop_api.root_resource_id}"
  path_part = "{eventid}"
}

resource "aws_api_gateway_method" "zabbix_alert_stop_api-method" {
  rest_api_id = "${aws_api_gateway_rest_api.zabbix_alert_stop_api.id}"
  resource_id = "${aws_api_gateway_resource.zabbix_alert_stop_api-eventid.id}"
  http_method = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "zabbix_alert_stop_api-integrate" {
  rest_api_id = "${aws_api_gateway_rest_api.zabbix_alert_stop_api.id}"
  resource_id = "${aws_api_gateway_resource.zabbix_alert_stop_api-eventid.id}"
  http_method = "${aws_api_gateway_method.zabbix_alert_stop_api-method.http_method}"
  type = "AWS"
  integration_http_method = "POST"
  uri = "arn:aws:apigateway:ap-northeast-1:lambda:path/2015-03-31/functions/${aws_lambda_function.zabbix_alert_stop.arn}/invocations"
  request_templates = {"application/json" = "${file("mapping_templates/zabbix_alert_stop.template")}"}
}

resource "aws_api_gateway_method_response" "200" {
  rest_api_id = "${aws_api_gateway_rest_api.zabbix_alert_stop_api.id}"
  resource_id = "${aws_api_gateway_resource.zabbix_alert_stop_api-eventid.id}"
  http_method = "${aws_api_gateway_method.zabbix_alert_stop_api-method.http_method}"
  status_code = "200"
  response_models = {"application/json" = "Empty"}
}

resource "aws_api_gateway_integration_response" "zabbix_alert_stop_api-integrate-response" {
  depends_on = ["aws_api_gateway_integration.zabbix_alert_stop_api-integrate"]
  rest_api_id = "${aws_api_gateway_rest_api.zabbix_alert_stop_api.id}"
  resource_id = "${aws_api_gateway_resource.zabbix_alert_stop_api-eventid.id}"
  http_method = "${aws_api_gateway_method.zabbix_alert_stop_api-method.http_method}"
  status_code = "${aws_api_gateway_method_response.200.status_code}"
}
*/
