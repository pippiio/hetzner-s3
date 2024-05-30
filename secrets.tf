# kics-scan ignore
resource "random_pet" "this" {
  for_each = var.minio_username == null ? { username = true } : {}
}

resource "random_password" "this" {
  for_each = var.minio_password == null ? { password = true } : {}
  length   = 16
}
