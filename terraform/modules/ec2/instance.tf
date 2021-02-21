resource "aws_instance" "web" {
    ami                        = var.ami   
    instance_type              = var.instance_type
    #availability_zone          = var.instance_az
    vpc_security_group_ids     = var.web_sg
    subnet_id                  = var.pri-subnet

    tags = {
        Name                   = "kapil-web-server"
    }
}






