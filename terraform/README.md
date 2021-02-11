# Terraform Problem
## Background
  This creates a very basic VPC with some subnets.
  This code was initially written for Terraform 11 and then partially updated to Terraform 12
  This VPC can have peering connections dependant on the `peers` variable

## Task
  Add a second peer
  Add routes to each peer to the route tables of the private subnets

## Optional
  Any updates to existing code to complete the Terraform 11 -> Terraform 12 migration
