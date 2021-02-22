provider "aws" {
    region = "us-east-1"
}


module "vpc" {
    source              = "../modules/vpc"
    az_count_v          =
    az_count_i          =
    env                 =
    region              =
    engineering_domain  =
    subnet_second_octet =
    subnet_third_octet  =
    subnet_identifiers  =
    peers               =
}


module "eip" {
    source              = "../modules/eip"
    az_count_v          = 



module "sg" {
    source              = "../modules/sg"
    websg_tag           =
    dbsg_tag            =
    myip                =
    vpc_id_virginia     = module.vpc.vpc_id_virginia
    vpc_id_ireland      = module.vpc.vpc_id_ireland
}


module "ec2" {
    source                  = "../modules/ec2"
    ami_virginia            =
    ami_ireland             =
    instance_type_virginia  =
    instance_type_ireland   =
    web_sg                  = module.sg.web_sg_id
    db_sg                   = module.sg.db_sg_id
    pri_subnet_virginia     = module.vpc.subnet_ids_private_virginia
    pri_subnet_ireland      = module.vpc.subnet_ids_private_ireland
}



