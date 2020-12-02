output "app_prefix" {
  value = local.name_prefix
}

output "edx-ip" {
  value = aws_instance.edx_instance.public_ip
}


