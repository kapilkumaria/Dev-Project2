##############################################################################################################################################
# Creating peering conections between 2 vpc - virginia (us-east-1) & ireland (eu-west-1) - number of connections depends upon number of peers
##############################################################################################################################################

resource "aws_vpc_peering_connection" "peers" {
  count         = "${ length(var.peers) }"
  vpc_id        = "${aws_vpc.vpg.id}"
  peer_vpc_id   = "${var.peers[count.index]["vpc"]}"
  peer_owner_id = "${var.peers[count.index]["owner"]}"
  peer_region   = "${var.peers[count.index]["region"]}"
  auto_accept   = false

  tags = {
    Side = "Requester"
    Environment = var.env,
  }
}


######################################################################################################################################
# Creating peering routes and adding them to private route tables - virginia (2 subnets - us-east-1) & ireland (1 subnet - eu-west-1)
######################################################################################################################################

resource "aws_route" "peers1" {
  count                     = "${ length(var.peers) }"
  route_table_id            = "${aws_route_table.private-subnet-route-table_v.*.id}"
  destination_cidr_block    = "${var.peers[count.index]["ip_range"]}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.peers[count.index].id}"
}


resource "aws_route" "peers2" {
  provider                  = "aws.ireland"
  count                     = "${ length(var.peers) }"
  route_table_id            = aws_route_table.private-subnet-route-table_i.id
  destination_cidr_block    = "${var.peers[count.index]["ip_range"]}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.peers[count.index].id}"
}

######################################################################################################################################
######################################################################################################################################