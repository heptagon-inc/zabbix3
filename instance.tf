resource "aws_instance" "zabbix3" {
    ami = "ami-f80e0596"
    instance_type = "t2.micro"
    key_name = "${aws_key_pair.ec2-tokyo-key.key_name}"
	subnet_id = "${aws_subnet.vpc-zabbix3-subnet-1a.id}"
    security_groups = ["${aws_security_group.zabbix3-sg.id}"]
	associate_public_ip_address = true
	root_block_device = {
		volume_type = "gp2"
		volume_size = 8
		delete_on_termination = true
	}
	tags {
		Name = "zabbix3"
	}
	depends_on = [
		"aws_security_group.zabbix3-sg",
		"aws_key_pair.ec2-tokyo-key",
		"aws_internet_gateway.vpc-zabbix3-igw"
	]
}

resource "aws_eip" "zabbix3-eip" {
	instance = "${aws_instance.zabbix3.id}"
	vpc = true
	depends_on = [
		"aws_instance.zabbix3"
	]
}
