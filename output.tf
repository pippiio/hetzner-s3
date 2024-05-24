output "minio_root_user" {
  value       = try(random_pet.this["username"].id, var.minio_username)
  description = "Username for Minio root user"
}

output "minio_root_password" {
  value       = try(random_password.this["password"].result, var.minio_password)
  description = "Password for Minio root user"
  sensitive   = true
}

output "server_ip" {
  value       = hcloud_primary_ip.this.ip_address
  description = "IP address of the MinIO server"
}
