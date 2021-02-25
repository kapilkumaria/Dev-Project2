
###########################################################################################################
# variables from module - vpc
###########################################################################################################

variable "az_count_v" {
  description = "Number of subnets / Availability zones to use"
  default     = "2"
}

variable "az_count_i" {
  description = "Number of subnets / Availability zones to use"
  default     = "1"
}

variable "env" {
  description = "Environment"
  default     = "dev"
}

variable "region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "engineering_domain" {
  description = "DNS zone"
  default     = "example.net"
}

variable "subnet_second_octet" {
  description = "Second Octet of the network"
  default     = "15"
}

variable "subnet_third_octet" {
  description = "Third Octet of the network"
  default     = "192"
}

variable "subnet_identifiers" {
  description = "List of AZs"
  type        = list
  default     = ["a", "b", "c"]
}

// variable "peers" {
//   description = "List of Maps"
//   type        = "list"
//   default     = []
// }


###########################################################################################################
# variables from module - eip
###########################################################################################################

// variable "az_count_v" {
//     default = 2
// }


###########################################################################################################
# variables from module - sg
###########################################################################################################

variable "websg_tag" {
    default = "kapil_websg"
}

variable "dbsg_tag" {
    default = "kapil_dbsg"
}

variable "myip" {
    default = "66.222.146.176/32"
}

#variable "vpc_id_virginia" {}
#variable "vpc_id_ireland" {}


###########################################################################################################
# variables from module - ec2
###########################################################################################################

variable "ami_virginia" {
    default = "ami-03d315ad33b9d49c4"
}

variable "ami_ireland" {
    default = "ami-022e8cc8f0d3c52fd"
}

variable "instance_type_virginia" {
    default = "t2.micro"
}

variable "instance_type_ireland" {
    default = "t2.micro"
}


#variable "web_sg" {}
#variable "db_sg" {}
#variable "pri_subnet_virginia" {}
#variable "pri_subnet_ireland" {}


###########################################################################################################
# variables for peering vpc information
###########################################################################################################


// variable "peers" {
//    description   = "List of Maps"
//   # type        = list(map(string))
//    type          = "list"
//    default       = [{
//  #    name        = "databases"
//      region      = {}
//  #    owner       = "123456789"
//      vpc         = {}
//      ip_range    = {}
//      auto_accept = "true"
//      side        = "Requestor"
//    },
//    {
//  #    name        = "databases"
//      region      = {}
//  #    owner       = "123456789"
//      vpc         = {}
//      ip_range    = {}
//      auto_accept = "true"
//      side        = "Requestor"
//    }]
//  }   
                  
                  
                  
                  
      
      



















