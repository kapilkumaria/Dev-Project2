###########################################################################################################
# Output values for vpc - virginia (us-east-1)
###########################################################################################################

output "vpc_id_virginia" {
    value = aws_vpc.vpg.id
}

output "vpc_arn_virginia" {
    value = aws_vpc.vpg.arn
}

output "vpc_cidr_virginia" {
    value = aws_vpc.vpg.cidr_block
}

// output "vpc_id_virginia" {
//     value = aws_vpc.vpg.id
// }

output "igw_id_virginia" {
    value = aws_internet_gateway.internet_gateway_v.id
}

// output "elastic_ip_ids_virginia" {
//     value = aws_eip.elastic_ip_v.*.id
// }

output "nat_gateway_ids_virginia" {
    value = aws_nat_gateway.nat_gateway_v.*.id
}

output "subnet_ids_utility_virginia" {
    value = aws_subnet.utility-subnet_v.*.id
}

output "subnet_ids_private_virginia" {
    value = aws_subnet.private-subnet_v.*.id
}

output "route_table_ids_utility_virginia" {
    value = aws_route_table.route_table_v.*.id
}

output "route_table_ids_private_virginia" {
    value = aws_route_table.private-subnet-route-table_v.*.id
}


###########################################################################################################
# Output values for vpc - ireland (eu-west-1)
###########################################################################################################


output "vpc_id_ireland" {
    value = aws_vpc.ipg.id
}

output "vpc_arn_ireland" {
    value = aws_vpc.ipg.arn
}

output "vpc_cidr_ireland" {
    value = aws_vpc.ipg.cidr_block
}

// output "vpc_id_ireland" {
//     value = aws_vpc.ipg.id
// }

output "igw_id_ireland" {
    value = aws_internet_gateway.internet_gateway_i.id
}

// output "elastic_ip_id_ireland" {
//     value = aws_eip.elastic_ip_i.id
// }

output "nat_gateway_id_ireland" {
    value = aws_nat_gateway.nat_gateway_i.id
}

output "subnet_id_utility_ireland" {
    value = aws_subnet.utility-subnet_i.id
}

output "subnet_ids_private_ireland" {
    value = aws_subnet.private-subnet_i.arn
}

output "route_table_id_private_ireland" {
    value = aws_route_table.private-subnet-route-table_i.id
}


output "peer_region_requestor" {
    value = ""
}


output "peer_vpc_requestor" {
    value = "aws_vpc.ipg.id"
}


output "peer_ip_range_requestor" {
    value = "aws_vpc.ipg.cidr_block"
}








###########################################################################################################