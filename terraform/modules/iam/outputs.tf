
output "ec2_iam_ssm_role_id" {
    value = aws_iam_role.ssm_role.id
}


output "ec2_iam_ssm_role_arn" {
    value = aws_iam_role.ssm_role.arn
}


output "ec2_iam_ssm_role_name" {
    value = aws_iam_role.ssm_role.name
}

output "ec2_iam_ssm_role_description" {
    value = aws_iam_role.ssm_role.description
}

output "ec2_profile_name" {
    value = aws_iam_instance_profile.ssm_profile.name
}

output "ec2_profile_id" {
    value = aws_iam_instance_profile.ssm_profile.id
}

output "ec2_profile_create_date" {
    value = aws_iam_instance_profile.ssm_profile.create_date
}

