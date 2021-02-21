###########################################################################################################
# Output values for ec2 instance's security group - virginia (us-east-1)
###########################################################################################################


output "web_sg_id" {
    value = aws_security_group.websg.id
}

output "web_sg_arn" {
    value = aws_security_group.websg.arn
}

output "web_sg_name" {
    value = aws_security_group.websg.name
}

output "web_sg_description" {
    value = aws_security_group.websg.description
}

output "web_sg_ingress" {
    value = aws_security_group.websg.ingress
}

output "web_sg_egress" {
    value = aws_security_group.websg.egress
}


###########################################################################################################
# Output values for ec2 instance's security group - ireland (eu-west-1)
###########################################################################################################


output "db_sg_id" {
    value = aws_security_group.dbsg.id
}

output "db_sg_arn" {
    value = aws_security_group.dbsg.arn
}

output "db_sg_name" {
    value = aws_security_group.dbsg.name
}

output "db_sg_description" {
    value = aws_security_group.dbsg.description
}

output "db_sg_ingress" {
    value = aws_security_group.dbsg.ingress
}

output "db_sg_egress" {
    value = aws_security_group.dbsg.egress
}

###########################################################################################################