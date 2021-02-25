output "eip_ids_v" {
    value = aws_eip.elastic_ip_v.*.id
}


output "eip_id_i" {
    value = aws_eip.elastic_ip_i.id
}