output "instance_profile" {
  value = data.aws_iam_instance_profile.ecs_profile
}

output "ec2_deploy" {
  value = data.aws_iam_instance_profile.cd
}

output "private_key" {
  sensitive = true
  value     = tls_private_key.ssh_key.private_key_pem
}
