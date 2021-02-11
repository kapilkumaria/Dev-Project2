variable "az_count" {
  description = "Number of subnets / Availability zones to use"
  default     = "2"
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
  default     = "200"
}

variable "peers" {
  description = "List of Maps"
  type        = "list"
  default     = []
}

