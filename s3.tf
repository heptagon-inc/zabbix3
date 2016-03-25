# terraform.tfstate
resource "aws_s3_bucket" "terraform-tfstate-zabbix3" {
	bucket = "terraform-tfstate-zabbix3"
	acl    = "private"
}
