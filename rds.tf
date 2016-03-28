resource "aws_db_instance" "zabbix3rds" {
	identifier = "zabbix3rds"
	engine = "mysql"
	engine_version = "5.6.27"
	instance_class = "db.t2.micro"
	availability_zone = "${aws_subnet.vpc-zabbix3-subnet-1a.availability_zone}"
	storage_type = "gp2"
	allocated_storage = 5
	name = "zabbix3rds"
	username = "${var.rds_username}"
	password = "${var.rds_password}"
	db_subnet_group_name = "${aws_db_subnet_group.zabbix3-db-subnet.id}"
	parameter_group_name = "${aws_db_parameter_group.zabbix3-db-pg.id}"
	vpc_security_group_ids = ["${aws_security_group.zabbix3-db-sg.id}"]
	storage_encrypted = false
	apply_immediately = true
	auto_minor_version_upgrade = true
	multi_az = false
	publicly_accessible = false
	backup_retention_period = 1
	depends_on = [
		"aws_security_group.zabbix3-db-sg",
		"aws_db_parameter_group.zabbix3-db-pg",
		"aws_db_subnet_group.zabbix3-db-subnet"
	]
}

resource "aws_db_subnet_group" "zabbix3-db-subnet" {
	name = "zabbix3-db-subnet"
	description = "zabbix3-db-subnet"
	subnet_ids = ["${aws_subnet.vpc-zabbix3-subnet-1a.id}","${aws_subnet.vpc-zabbix3-subnet-1c.id}"]
	tags {
		Name = "zabbix3-db-subnet"
	}
}

resource "aws_db_parameter_group" "zabbix3-db-pg" {
	name = "zabbix3-db-pg"
	family = "mysql5.6"
	description = "zabbix3-db-pg"
	tags {
		Name = "zabbix3-db-pg"
	}

	parameter {
		name = "character_set_server"
		value = "utf8mb4"
		apply_method = "immediate"
	}

	parameter {
		name = "character_set_client"
		value = "utf8mb4"
		apply_method = "immediate"
	}

	parameter {
		name = "character_set_connection"
		value = "utf8mb4"
		apply_method = "immediate"
	}

	parameter {
		name = "character_set_database"
		value = "utf8mb4"
		apply_method = "immediate"
	}

	parameter {
		name = "character_set_results"
		value = "utf8mb4"
		apply_method = "immediate"
	}

	parameter {
		name = "time_zone"
		value = "Asia/Tokyo"
		apply_method = "immediate"
	}

	parameter {
		name = "innodb_large_prefix"
		value = "1"
		apply_method = "immediate"
	}

	parameter {
		name = "innodb_file_format"
		value = "Barracuda"
		apply_method = "immediate"
	}
}
