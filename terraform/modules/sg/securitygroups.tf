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
# Creating 2 security groups - for ec2 instances in virginia (us-east-1) & 2nd in ireland (eu-west-1 )
###########################################################################################################


# Creating a security group for private server in virginia

resource "aws_security_group" "websg" {
  name        = "allow_ssh_traffic"
  description = "Allow ssh connection only"
  vpc_id      = var.vpc_id_virginia

  ingress {
    description = "Allowing ICMP traffic from 2nd vpc"
    from_port   = "-1"
    to_port     = "-1"
    protocol    = "icmp"
    cidr_blocks = [var.icmp_conn_v]
  }

  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.websg_tag
  }
}


# Creating a security group for private server in ireland

resource "aws_security_group" "dbsg" {
  provider    = aws.ireland
  name        = "allow_ssh_traffic"
  description = "Allow ssh connection only"
  vpc_id      = var.vpc_id_ireland


  ingress {
    description = "Allowing ICMP traffic from 1st vpc"
    from_port   = "-1"
    to_port     = "-1"
    protocol    = "icmp"
    cidr_blocks = [var.icmp_conn_i]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.dbsg_tag
  }
}


###########################################################################################################