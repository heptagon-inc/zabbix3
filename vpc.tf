resource "aws_vpc" "vpc-zabbix3" {
    cidr_block = "10.100.0.0/16"
    tags {
        Name = "vpc-zabbix3"
    }
}

resource "aws_internet_gateway" "vpc-zabbix3-igw" {
    vpc_id = "${aws_vpc.vpc-zabbix3.id}"
    tags {
        Name = "vpc-zabbix3-igw"
    }
}

resource "aws_subnet" "vpc-zabbix3-subnet-1a" {
    vpc_id = "${aws_vpc.vpc-zabbix3.id}"
    cidr_block = "10.100.0.0/24"
    availability_zone = "ap-northeast-1a"
    tags {
        Name = "vpc-zabbix3-subnet-1a"
    }
}

resource "aws_subnet" "vpc-zabbix3-subnet-1c" {
    vpc_id = "${aws_vpc.vpc-zabbix3.id}"
    cidr_block = "10.100.1.0/24"
    availability_zone = "ap-northeast-1c"
    tags {
        Name = "vpc-zabbix3-subnet-1c"
    }
}

resource "aws_route_table" "vpc-zabbix3-public-rt" {
    vpc_id = "${aws_vpc.vpc-zabbix3.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.vpc-zabbix3-igw.id}"
    }
    tags {
        Name = "vpc-zabbix3-public-rt"
    }
}

resource "aws_route_table_association" "vpc-zabbix3-rta-1a" {
    subnet_id = "${aws_subnet.vpc-zabbix3-subnet-1a.id}"
    route_table_id = "${aws_route_table.vpc-zabbix3-public-rt.id}"
}

resource "aws_route_table_association" "vpc-zabbix3-rta-1c" {
    subnet_id = "${aws_subnet.vpc-zabbix3-subnet-1c.id}"
    route_table_id = "${aws_route_table.vpc-zabbix3-public-rt.id}"
}
