variable "ami_virginia" {
    default = "ami-02e44367276fe7adc"
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

variable "instance_type" {
    default = "t2.micro"
}




variable "web_sg" {}
variable "db_sg" {}
variable "pri_subnet_virginia" {}
variable "pri_subnet_ireland" {}