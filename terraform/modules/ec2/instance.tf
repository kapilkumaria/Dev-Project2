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
# Creating 2 instances in private subnets - 1st in virginia (us-east-1) & 2nd in ireland (eu-west-1 )
###########################################################################################################


resource "aws_instance" "ec2_virginia" {
    ami                        = var.ami_virginia  
    instance_type              = var.instance_type_virginia
    vpc_security_group_ids     = [var.web_sg]
    subnet_id                  = var.pri_subnet_virginia
    iam_instance_profile       = var.instance_profile
    #user_data                  = file("ssm-agent-install.sh")
 
    tags = {
        Name                   = "server-virginia"
    }
}


resource "aws_instance" "ec2_ireland" {
    provider                   = aws.ireland
    ami                        = var.ami_ireland
    instance_type              = var.instance_type_ireland
    vpc_security_group_ids     = [var.db_sg]
    subnet_id                  = var.pri_subnet_ireland
    iam_instance_profile       = var.instance_profile
    #user_data                  = file("ssm-agent-install.sh")

    tags = {
        Name                   = "server-ireland"
    }
}

###########################################################################################################