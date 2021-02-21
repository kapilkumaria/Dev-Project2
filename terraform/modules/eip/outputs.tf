output "eip_id" {
    value = aws_eip.lb.id
}

output "eip_instance" {
    value = aws_eip.lb.instance
}


output "eip_private_ip" {
    value = aws_eip.lb.private_ip
}

output "eip_public_ip" {
    value = aws_eip.lb.public_ip
}

output "eip_private_dns" {
    value = aws_eip.lb.private_dns
}

output "eip_network_interface" {
    value = aws_eip.lb.network_interface
}


