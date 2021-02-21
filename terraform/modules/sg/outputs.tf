output "web_sg_id" {
    value = aws_instance.web.id
}


output "web_sg_arn" {
    value = aws_instance.web.arn
}

output "web_sg_vpc_id" {
    value = aws_instance.web.vpc_id
}

output "web_sg_owner_id" {
    value = aws_instance.web.owner_id
}

output "web_sg_id" {
    value = aws_instance.web.name
}

output "web_sg_description" {
    value = aws_instance.web.description
}

output "web_sg_ingress" {
    value = aws_instance.web.ingress
}

output "web_sg_egress" {
    value = aws_instance.web.egress
}

