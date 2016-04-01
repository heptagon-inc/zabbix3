// used by lambda function [zabbix_alert_stop]
resource "aws_kms_key" "zabbix_alert_stop_kms" {}
resource "aws_kms_alias" "zabbix_alert_stop_kms" {
	name = "alias/zabbix/alert/stop"
	target_key_id = "${aws_kms_key.zabbix_alert_stop_kms.key_id}"
}
