resource "hcloud_primary_ip" "this" {
  name              = "${local.name_prefix}object-storage-primary-ip"
  type              = "ipv4"
  assignee_type     = "server"
  datacenter        = var.server_datacenter
  auto_delete       = false
  delete_protection = true

  labels = local.default_labels
}
