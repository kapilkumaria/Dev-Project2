output "web_ec2_id" {
    value = aws_instance.ec2_virginia.id
}


output "web_ec2_arn" {
    value = aws_instance.ec2_virginia.arn
}


output "web_ec2_public_dns" {
    value = aws_instance.ec2_virginia.public_dns
}


output "web_ec2_private_dns" {
    value = aws_instance.ec2_virginia.private_dns
}


output "web_ec2_public_ip" {
    value = aws_instance.ec2_virginia.public_ip
}
