
resource "hcloud_server" "single" {
  name         = "${local.name_prefix}object-storage-server"
  image        = "ubuntu-22.04"
  server_type  = var.server_type
  datacenter   = var.server_datacenter
  firewall_ids = [hcloud_firewall.this.id]

  user_data = templatefile("${path.module}/templates/user-data-single.yaml.tftpl", {
    MINIO_ROOT_USER     = try(random_pet.this["username"].id, var.minio_username)
    MINIO_ROOT_PASSWORD = try(random_password.this["password"].result, var.minio_password)

    STORAGE_USERNAME = var.sshfs_user
    STORAGE_IP       = var.sshfs_ip
    STORAGE_PATH     = var.sshfs_path
    STORAGE_SSH_KEY  = var.sshfs_ssh_key
  })

  network {
    alias_ips  = []
    ip         = cidrhost(try(hcloud_network_subnet.this["network"].ip_range, var.network_cidr), 5)
    network_id = try(hcloud_network.this["network"].id, var.network_id)
  }

  public_net {
    ipv4_enabled = true
    ipv4         = hcloud_primary_ip.this.id
    ipv6_enabled = false
  }

  delete_protection  = true
  rebuild_protection = true

  labels = local.default_labels
}
