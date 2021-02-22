az_count_v              = "2"
az_count_i              = "1"
env                     = "dev"
region                  = "us-west-1"
engineering_domain      = "kapil.net"
subnet_second_octet     = "15"
subnet_third_octet      = "192"
subnet_identifiers      = ["a", "b", "c"]

peers                   = [{
    name        = "databases"
    region      = "eu-west-2"
    owner       = "123456789012"
    vpc         = "vpc-abc123def45678900"
    ip_range    = "192.168.121.0/22"
    auto_accept = "true"
    side        = "Requestor"
  }]

websg_tag               = "kapil_websg"
dbsg_tag                = "kapil_dbsg"
myip                    = "66.222.146.176/32"
ami_virginia            = "ami-02e44367276fe7adc"
ami_ireland             = "ami-022e8cc8f0d3c52fd"   
instance_type_virginia  = "t2.micro"
instance_type_ireland   = "t2.micro"