##############################################################################################################################################
# Creating peering conections between 2 vpc - virginia (us-east-1) & ireland (eu-west-1) - number of connections depends upon number of peers
##############################################################################################################################################


# Requester's side of the connection

resource "aws_vpc_peering_connection" "peers_connections" {
  vpc_id        = aws_vpc.vpg.id
  peer_vpc_id   = aws_vpc.ipg.id
  peer_region   = "eu-west-1"
  
  auto_accept   = false

  tags = {
    Side = "Requester"
    Environment = var.env,
  }
}


resource "aws_vpc_peering_connection_accepter" "peer1" {
  provider                  = aws.ireland
  vpc_peering_connection_id = aws_vpc_peering_connection.peers_connections.id
  auto_accept               = true

  tags = {
    Side = "Accepter"
  }
}          


######################################################################################################################################
# Creating peering routes and adding them to private route tables - virginia (2 subnets - us-east-1) & ireland (1 subnet - eu-west-1)
######################################################################################################################################

resource "aws_route" "peers1" {
  route_table_id            = aws_route_table.private-subnet-route-table_v.id
  destination_cidr_block    = aws_vpc.ipg.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peers_connections.id
  depends_on                = [aws_route_table.private-subnet-route-table_v]
}


resource "aws_route" "peers2" {
  provider                  = aws.ireland
  route_table_id            = aws_route_table.private-subnet-route-table_i.id
  destination_cidr_block    = aws_vpc.vpg.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peers_connections.id
  depends_on                = [aws_route_table.private-subnet-route-table_i]
}


######################################################################################################################################
######################################################################################################################################