###########################################################################################################
# Output values for all VPC
###########################################################################################################


# Output values for vpc - virginia (us-east-1)

output "vpc_id_virginia" {
    value = module.vpc.vpc_id_virginia
}

output "vpc_arn_virginia" {
    value = module.vpc.vpc_arn_virginia
}

output "vpc_cidr_virginia" {
    value = module.vpc.vpc_cidr_virginia
}

output "igw_id_virginia" {
    value = module.vpc.igw_id_virginia
}

output "nat_gateway_ids_virginia" {
    value = module.vpc.nat_gateway_ids_virginia
}

output "subnet_ids_utility_virginia" {
    value = module.vpc.subnet_ids_utility_virginia
}

output "subnet_ids_private_virginia" {
    value = module.vpc.subnet_ids_private_virginia
}

output "route_table_ids_utility_virginia" {
    value = module.vpc.route_table_ids_utility_virginia
}

output "route_table_ids_private_virginia" {
    value = module.vpc.route_table_ids_private_virginia
}


# Output values for vpc - virginia (us-east-1)

output "vpc_id_ireland" {
    value = module.vpc.vpc_id_ireland
}

output "vpc_arn_ireland" {
    value = module.vpc.vpc_arn_ireland
}

output "vpc_cidr_ireland" {
    value = module.vpc.vpc_cidr_ireland
}

output "igw_id_ireland" {
    value = module.vpc.igw_id_ireland
}
output "nat_gateway_id_ireland" {
    value = module.vpc.nat_gateway_id_ireland
}

output "subnet_id_utility_ireland" {
    value = module.vpc.subnet_id_utility_ireland
}

output "subnet_ids_private_ireland" {
    value = module.vpc.subnet_ids_private_ireland
}

output "route_table_id_private_ireland" {
    value = module.vpc.route_table_id_private_ireland
}


output "peer_vpc_requestor" {
    value = module.vpc.peer_vpc_requestor
}


output "peer_ip_range_requestor" {
    value = module.vpc.peer_ip_range_requestor
}


#####################################################################################################################
# Output values for all security groups (2 security groups -  1st in us-east-1 & 2nd in eu-west-1)
#####################################################################################################################


# Output values for security groups - virginia (us-east-1) & ireland (eu-west-1)


output "web_sg_id" {
    value = module.sg.web_sg_id
}

output "web_sg_arn" {
    value = module.sg.web_sg_arn
}

output "web_sg_name" {
    value = module.sg.web_sg_name
}

output "web_sg_description" {
    value = module.sg.web_sg_description
}

output "web_sg_ingress" {
    value = module.sg.web_sg_ingress
}

output "web_sg_egress" {
    value = module.sg.web_sg_egress
}

output "db_sg_id" {
    value = module.sg.db_sg_id
}

output "db_sg_arn" {
    value = module.sg.db_sg_arn
}

output "db_sg_name" {
    value = module.sg.db_sg_name
}

output "db_sg_description" {
    value = module.sg.db_sg_description
}

output "db_sg_ingress" {
    value = module.sg.db_sg_ingress
}

output "db_sg_egress" {
    value = module.sg.db_sg_egress
}


#####################################################################################################################
# Output values for all ec2 instances (2 instances -  1st in us-east-1 & 2nd in eu-west-1)
#####################################################################################################################


# Output values for ec2 instances - virginia (us-east-1) & ireland (eu-west-1)


output "web_ec2_id" {
    value = module.ec2.web_ec2_id
}

output "web_ec2_arn" {
    value = module.ec2.web_ec2_arn
}


output "web_ec2_public_dns" {
    value = module.ec2.web_ec2_public_dns
}


output "web_ec2_private_dns" {
    value = module.ec2.web_ec2_private_dns
}


output "web_ec2_public_ip" {
    value = module.ec2.web_ec2_public_ip
}


#####################################################################################################################
# Output values for all elastic IP (2 EIP -  1st in us-east-1 & 2nd in eu-west-1)
#####################################################################################################################


output "eip_ids_v" {
    value = module.eip.eip_ids_v
}


output "eip_id_i" {
    value = module.eip.eip_id_i
}


#####################################################################################################################
# Output values for IAM module
#####################################################################################################################


output "ec2_iam_ssm_role_id" {
    value = module.iam.ec2_iam_ssm_role_id
}


output "ec2_iam_ssm_role_arn" {
    value = module.iam.ec2_iam_ssm_role_arn
}


output "ec2_iam_ssm_role_name" {
    value = module.iam.ec2_iam_ssm_role_name
}

output "ec2_iam_ssm_role_description" {
    value = module.iam.ec2_iam_ssm_role_description
}

output "ec2_profile_name" {
    value = module.iam.ec2_profile_name
}

output "ec2_profile_id" {
    value = module.iam.ec2_profile_id
}

output "ec2_profile_create_date" {
    value = module.iam.ec2_profile_create_date
}


#####################################################################################################################




