# for instance
resource "aws_security_group" "zabbix3-sg" {
    name = "zabbix3-sg"
    description = "Used in the terraform"
	vpc_id = "${aws_vpc.vpc-zabbix3.id}"
	tags {
		Name = "zabbix3-sg"
	}
}
resource "aws_security_group_rule" "allow_ssh_access" {
	type = "ingress"
	from_port = 22
	to_port = 22
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
	security_group_id = "${aws_security_group.zabbix3-sg.id}"
}
resource "aws_security_group_rule" "allow_zabbix_server_access" {
	type = "ingress"
	from_port = 10051
	to_port = 10051
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
	security_group_id = "${aws_security_group.zabbix3-sg.id}"
}
resource "aws_security_group_rule" "allow_http_access" {
	type = "ingress"
	from_port = 80
	to_port = 80
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
	security_group_id = "${aws_security_group.zabbix3-sg.id}"
}
resource "aws_security_group_rule" "allow_https_access" {
	type = "ingress"
	from_port = 443
	to_port = 443
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
	security_group_id = "${aws_security_group.zabbix3-sg.id}"
}
resource "aws_security_group_rule" "allow_all_1" {
	type = "egress"
	from_port = 0
	to_port = 0
	protocol = "-1"
	cidr_blocks = ["0.0.0.0/0"]
	security_group_id = "${aws_security_group.zabbix3-sg.id}"
}

# for rds
resource "aws_security_group" "zabbix3-db-sg" {
	name = "zabbix3-db-sg"
	description = "zabbix3-db-sg"
	vpc_id = "${aws_vpc.vpc-zabbix3.id}"
	tags {
        Name = "zabbix3-db-sg"
    }
}
resource "aws_security_group_rule" "allow_mysql_access" {
	type = "ingress"
	from_port = 3306
	to_port = 3306
	protocol = "tcp"
	source_security_group_id = "${aws_security_group.zabbix3-sg.id}"
	security_group_id = "${aws_security_group.zabbix3-db-sg.id}"
}
resource "aws_security_group_rule" "allow_all_2" {
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = "${aws_security_group.zabbix3-db-sg.id}"
}
