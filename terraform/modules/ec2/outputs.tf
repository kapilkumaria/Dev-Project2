output "web_ec2_id" {
    value = aws_instance.web.id
}


output "web_ec2_arn" {
    value = aws_instance.web.arn
}


output "web_ec2_public_dns" {
    value = aws_instance.web.public_dns
}


output "web_ec2_private_dns" {
    value = aws_instance.web.private_dns
}


output "web_ec2_public_ip" {
    value = aws_instance.web.public_ip
}
