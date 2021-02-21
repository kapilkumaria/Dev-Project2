env         = "testing"
region      = "eu-west-2"

az_count    = 3
subnet_second_octet = 19
subnet_third_octet  = 240

peers = [{
    name        = "databases"
    region      = "eu-west-2"
    owner       = "123456789012"
    vpc         = "vpc-abc123def45678900"
    ip_range    = "192.168.121.0/22"
    auto_accept = "true"
    side        = "Requestor"
  }]
