output "ec2_profile" {
    value = aws_iam_instance_profile.ssm_profile.name
}