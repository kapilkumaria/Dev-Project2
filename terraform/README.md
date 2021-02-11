# Terraform Problem
## Background
  This creates a very basic VPC with some subnets.
  
  The code was initially written for Terraform 11 and then partially updated to Terraform 12
  This VPC can have peering connections dependant on the `peers` variable

## Task
  Add a second peer, and create one ec2 instance in each private subnet.

  Add routes to each peer to the route tables of the private subnets
  
  Please make use of modules to structure your work.
  

## Others
  Any updates to existing code to complete the Terraform 11 -> Terraform 12 migration
## Testing The Infrastructure.
  We will log into the ec2 instance in one vpc via ssm and test connectivity with the instance
  in the other VPC via ICMP.
