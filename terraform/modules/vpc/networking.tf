

resource "aws_eip" "elastic_ip" {
  count = var.az_count
  vpc   = true
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.lpg.id
}

resource "aws_nat_gateway" "nat_gateway" {
  count         = var.az_count
  allocation_id = element(aws_eip.elastic_ip[*].id,count.index)
  subnet_id     = element(aws_subnet.utility-subnet[*].id,count.index)
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet_gateway.id
}

resource "aws_route" "private-subnet-default_route" {
  count                  = var.az_count
  route_table_id         = element(aws_route_table.private-subnet-route-table.*.id,count.index)
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = element(aws_nat_gateway.nat_gateway.*.id,count.index)
}

resource "aws_route_table" "private-subnet-route-table" {
  count   = var.az_count
  vpc_id  = aws_vpc.lpg.id
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.lpg.id
}

resource "aws_route_table_association" "private-subnet-rt-association" {
  count          = var.az_count
  subnet_id      = element(aws_subnet.private-subnet.*.id,count.index)
  route_table_id = element(aws_route_table.private-subnet-route-table.*.id,count.index)
}

resource "aws_route_table_association" "utility-subnet-rt-association" {
  count          = var.az_count
  subnet_id      = element(aws_subnet.utility-subnet.*.id,count.index)
  route_table_id = aws_route_table.route_table.id
}

resource "aws_subnet" "private-subnet" {
  count             = var.az_count
  vpc_id            = aws_vpc.lpg.id
  cidr_block        = "172.${var.subnet_second_octet}.${var.subnet_third_octet + (count.index * 2)}.0/23"
  availability_zone = "${var.region}${var.subnet_identifiers[count.index]}"

  tags = map(
      "SubnetType", "Private"
    )

  lifecycle {
    ignore_changes = ["tags"]
  }
}

resource "aws_subnet" "utility-subnet" {
  count             = var.az_count
  vpc_id            = aws_vpc.lpg.id
  cidr_block        = "172.${var.subnet_second_octet}.${var.subnet_third_octet + 14}.${count.index * 32}/27"
  availability_zone = "${var.region}${var.subnet_identifiers[count.index]}"

  tags = map(
      "SubnetType", "Utility"
    )

  lifecycle {
    ignore_changes = ["tags"]
  }
}


resource "aws_vpc" "lpg" {
  cidr_block           = "172.${var.subnet_second_octet}.${var.subnet_third_octet}.0/20"
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_vpc_dhcp_options" "lpg" {
  domain_name         = "${var.env}.${var.engineering_domain}"
  domain_name_servers = ["AmazonProvidedDNS"]
}

resource "aws_vpc_dhcp_options_association" "lpg" {
  vpc_id          = aws_vpc.lpg.id
  dhcp_options_id = aws_vpc_dhcp_options.lpg.id
}
