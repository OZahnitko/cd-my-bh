output "instance_profile" {
  value = data.aws_iam_instance_profile.ecs_profile
}

output "private_key" {
  sensitive = true
  value     = tls_private_key.ssh_key.private_key_pem
}
