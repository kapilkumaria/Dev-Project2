az_count_v              = "2"
az_count_i              = "1"
env                     = "dev"
#region                  = "us-west-1"
engineering_domain      = "kapil.net"
subnet_second_octet     = "15"
subnet_third_octet      = "192"
subnet_identifiers      = ["a", "b", "c"]
websg_tag               = "kapil_websg"
dbsg_tag                = "kapil_dbsg"
myip                    = "66.222.146.176/32"
ami_virginia            = "ami-03d315ad33b9d49c4"
ami_ireland             = "ami-022e8cc8f0d3c52fd"   
instance_type_virginia  = "t2.micro"
instance_type_ireland   = "t2.micro"
peers                   =   [{
                              name        = {}
                              region      = {}
                              owner       = {}
                              vpc         = {}
                              ip_range    = {}
                              auto_accept = "true"
                              side        = "Requestor"
                            },
                            {
                              name        = {}
                              region      = {}
                              owner       = {}
                              vpc         = {}
                              ip_range    = {}
                              auto_accept = "true"
                              side        = "Requestor"
                           }]
