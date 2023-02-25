## Create Static Access Keys
resource "yandex_iam_service_account_static_access_key" "sa-storage-admin-static-key" {
  service_account_id = yandex_iam_service_account.sa-storage-admin.id
}

## Use keys to create bucket
resource "yandex_storage_bucket" "this" {
  description   = var.description
  access_key    = yandex_iam_service_account_static_access_key.sa-storage-admin-static-key.access_key
  secret_key    = yandex_iam_service_account_static_access_key.sa-storage-admin-static-key.secret_key
  bucket        = var.bucket
  force_destroy = true
}

output "yandex_storage_bucket_loki_access_key" {
  value     = yandex_storage_bucket.this.access_key
  sensitive = true
}

output "yandex_storage_bucket_loki_secret_key" {
  value     = yandex_storage_bucket.this.secret_key
  sensitive = true
}

output "yandex_storage_bucket_loki_bucket" {
  value     = yandex_storage_bucket.this.bucket
  sensitive = true
}
