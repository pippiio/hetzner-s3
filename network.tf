resource "hcloud_network" "this" {
  for_each = var.network_id == null ? { network : true } : {}

  name              = "${local.name_prefix}object-storage-network"
  ip_range          = var.network_cidr
  delete_protection = true

  labels = local.default_labels
}

resource "hcloud_network_subnet" "this" {
  for_each = hcloud_network.this

  network_id   = each.value.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = var.network_subnet
}
