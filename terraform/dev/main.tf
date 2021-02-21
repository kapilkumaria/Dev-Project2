provider "aws" {
    region = "us-east-1"
}


module "vpc" {
    source = "../modules/vpc"
    region = var.region








}


module "sg" {
    source = "../modules/sg"
    vpc_id = module.vpc.vpc_id
    myip = var.myip
    websg_tag = var.websg_tag  
}