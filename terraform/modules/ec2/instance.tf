resource "aws_instance" "web" {
    ami                 = var.ami   
    instance_type       = var.instance_type
    availability_zone   = var.instance_az
    security_groups     = var.web_sg

    tags = {
        Name            = "kapil-web-server"
    }
}



