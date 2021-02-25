###########################################################################################################
# Declaring aws with 2 regions - default is virginia (us-east-1) & 2nd is ireland (eu-west-1)
###########################################################################################################

provider "aws" {
  region    = "us-east-1"
}

provider "aws" {
  alias     = "ireland" 
  region    = "eu-west-1"
}


###########################################################################################################
# Creating 2 vpc - 1st in virginia (us-east-1) & 2nd in ireland (eu-west-1 )
###########################################################################################################

resource "aws_vpc" "vpg" {
  cidr_block           = "172.${var.subnet_second_octet}.${var.subnet_third_octet}.0/20"
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_vpc" "ipg" {
  provider             = "aws.ireland"
  cidr_block           = "192.${var.subnet_second_octet}.${var.subnet_third_octet}.0/20"
  enable_dns_hostnames = true
  enable_dns_support   = true
}


###########################################################################################################
# Creating 2 internet gateway for each vpc - 1st in virginia (us-east-1) & 2nd in ireland (eu-west-1 )
###########################################################################################################


resource "aws_internet_gateway" "internet_gateway_v" {
  vpc_id    = aws_vpc.vpg.id
}


resource "aws_internet_gateway" "internet_gateway_i" {
  provider  = aws.ireland
  vpc_id    = aws_vpc.ipg.id
}


###############################################################################################################################
# Creating 3 nat gateways for private subnets - 2 in virginia (us-east-1) & 3rd in ireland (eu-west-1 )
###############################################################################################################################

######

resource "aws_nat_gateway" "nat_gateway_v" {
  count           = var.az_count_v
  allocation_id   = element(var.elastic_ip_v,count.index)
  subnet_id       = element(aws_subnet.utility-subnet_v[*].id,count.index)
}


resource "aws_nat_gateway" "nat_gateway_i" {
  provider        = "aws.ireland"
  allocation_id   = var.elastic_ip_i
  subnet_id       = aws_subnet.utility-subnet_i.id
}


###############################################################################################################################
# Creating 2 public and 2 private subnets - in virginia (us-east-1)
###############################################################################################################################

resource "aws_subnet" "private-subnet_v" {
  count             = var.az_count_v
  vpc_id            = aws_vpc.vpg.id
  cidr_block        = "172.${var.subnet_second_octet}.${var.subnet_third_octet + (count.index * 2)}.0/23"
  availability_zone = "${var.region}${var.subnet_identifiers[count.index]}"

  tags = map(
      "SubnetType", "Private"
    )

  lifecycle {
    ignore_changes = ["tags"]
  }
}


resource "aws_subnet" "utility-subnet_v" {
  count             = var.az_count_v
  vpc_id            = aws_vpc.vpg.id
  cidr_block        = "172.${var.subnet_second_octet}.${var.subnet_third_octet + 14}.${count.index * 32}/27"
  availability_zone = "${var.region}${var.subnet_identifiers[count.index]}"

  tags = map(
      "SubnetType", "Utility"
    )

  lifecycle {
    ignore_changes = ["tags"]
  }
}


###############################################################################################################################
# Creating 1 public & 1 private subnet - in ireland (eu-west-1)
###############################################################################################################################


resource "aws_subnet" "private-subnet_i" {
  provider          = "aws.ireland"
  vpc_id            = aws_vpc.ipg.id
  cidr_block        = "192.${var.subnet_second_octet}.${var.subnet_third_octet}.0/23"
  availability_zone = "${var.region}${var.subnet_identifiers[0]}"

  tags = map(
      "SubnetType", "Private"
    )

  lifecycle {
    ignore_changes = ["tags"]
  }
}


resource "aws_subnet" "utility-subnet_i" {
  provider          = "aws.ireland"
  vpc_id            = aws_vpc.ipg.id
  cidr_block        = "192.${var.subnet_second_octet}.${var.subnet_third_octet + 14}.0/27"
  availability_zone = "${var.region}${var.subnet_identifiers[0]}"

  tags = map(
      "SubnetType", "Utility"
    )

  lifecycle {
    ignore_changes = ["tags"]
  }
}


###############################################################################################################################
# Creating route tables & its components - in virginia (us-east-1)
###############################################################################################################################


# creating route tables

resource "aws_route_table" "private-subnet-route-table_v" {
  vpc_id  = aws_vpc.vpg.id
}


resource "aws_route_table" "route_table_v" {
  vpc_id = aws_vpc.vpg.id
}


# Creating routes and adding them to public & private route tables

resource "aws_route" "default_route_v" {
  route_table_id         = aws_route_table.route_table_v.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet_gateway_v.id
}


resource "aws_route" "private-subnet-default_route_v" {
  count                  = var.az_count_v
  route_table_id         = element(aws_route_table.private-subnet-route-table_v.*.id,count.index)
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = element(aws_nat_gateway.nat_gateway_v.*.id,count.index)
}

###########################################################peering connection and peering routes are in "peering.tf"


# subnets assosciation with public route tables

resource "aws_route_table_association" "utility-subnet-rt-association_v" {
  count          = var.az_count_v
  subnet_id      = element(aws_subnet.utility-subnet_v.*.id,count.index)
  route_table_id = aws_route_table.route_table_v.id
}


# subnets assosciation with private route tables

resource "aws_route_table_association" "private-subnet-rt-association_v" {
  count          = var.az_count_v
  subnet_id      = element(aws_subnet.private-subnet_v.*.id,count.index)
  route_table_id = aws_route_table.private-subnet-route-table_v.id
}


###############################################################################################################################
# Creating route tables & its components - in ireland (eu-west-1)
###############################################################################################################################


# creating private route table

resource "aws_route_table" "private-subnet-route-table_i" {
  provider               = "aws.ireland"
  vpc_id                 = aws_vpc.ipg.id
}


# Creating routes and adding them to private route table

resource "aws_route" "private-subnet-default_route_i" {
  provider               = "aws.ireland"
  route_table_id         = aws_route_table.private-subnet-route-table_i.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway_i.id
}


###########################################################peering connection and peering routes are in "peering.tf"

# subnets assosciation with private route tables

resource "aws_route_table_association" "private-subnet-rt-association_i" {
  provider               = "aws.ireland"
  subnet_id              = aws_subnet.private-subnet_i.id
  route_table_id         = aws_route_table.private-subnet-route-table_i.id
}



###############################################################################################################################
# Creating dhcp options for - virginia (us-east-1)
###############################################################################################################################

resource "aws_vpc_dhcp_options" "vpg_dhcp" {
  domain_name           = "${var.env}.${var.engineering_domain}"
  domain_name_servers   = ["AmazonProvidedDNS"]
}

resource "aws_vpc_dhcp_options_association" "lpg" {
  vpc_id                = aws_vpc.vpg.id
  dhcp_options_id       = aws_vpc_dhcp_options.vpg_dhcp.id
}

###############################################################################################################################
###############################################################################################################################
