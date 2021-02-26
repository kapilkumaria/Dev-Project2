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


###############################################################################################################################
# Creating 3 elastic ips for nat gateways for private subnets - 2 in virginia (us-east-1) & 3rd in ireland (eu-west-1 )
###############################################################################################################################


resource "aws_eip" "elastic_ip_v" {
  #count   = var.az_count_v
  vpc     = true
}


resource "aws_eip" "elastic_ip_i" {
  provider  = aws.ireland
  vpc       = true
}


###############################################################################################################################