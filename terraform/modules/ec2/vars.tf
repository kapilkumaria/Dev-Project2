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



variable "web_sg" {}
variable "db_sg" {}
variable "pri_subnet_virginia" {}
variable "pri_subnet_ireland" {}
variable  "instance_profile" {}