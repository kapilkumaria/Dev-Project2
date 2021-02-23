provider "aws" {
    region = "us-east-1"
}


module "vpc" {
    source              = "../modules/vpc"
    az_count_v          = var.az_count_v
    az_count_i          = var.az_count_i
    env                 = var.env
    region              = var.region
    engineering_domain  = var.engineering_domain
    subnet_second_octet = var.subnet_second_octet
    subnet_third_octet  = var.subnet_third_octet
    subnet_identifiers  = var.subnet_identifiers
    #peers               = var.peers
#    peers.region     = module.vpc.peer_region_requestor
#    peers.vpc        = module.vpc.peer_vpc_requestor
#    peers.ip_range   = module.vpc.peer_ip_range_requestor
}


module "eip" {
    source              = "../modules/eip"
    az_count_v          = var.az_count_v

}

module "sg" {
    source              = "../modules/sg"
    websg_tag           = var.websg_tag
    dbsg_tag            = var.dbsg_tag
    myip                = var.myip
    vpc_id_virginia     = module.vpc.vpc_id_virginia
    vpc_id_ireland      = module.vpc.vpc_id_ireland
}


module "ec2" {
    source                  = "../modules/ec2"
    ami_virginia            = var.ami_virginia
    ami_ireland             = var.ami_ireland
    instance_type_virginia  = var.instance_type_virginia
    instance_type_ireland   = var.instance_type_ireland
    web_sg                  = module.sg.web_sg_id
    db_sg                   = module.sg.db_sg_id
    pri_subnet_virginia     = module.vpc.subnet_ids_private_virginia
    pri_subnet_ireland      = module.vpc.subnet_ids_private_ireland
}



