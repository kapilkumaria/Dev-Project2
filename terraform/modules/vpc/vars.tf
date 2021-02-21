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

variable "peers" {
  description = "List of Maps"
  type        = "list"
  default     = []
}