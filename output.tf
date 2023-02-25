output "yandex_storage_bucket_access_key" {
  value     = yandex_storage_bucket.this.access_key
  sensitive = true
}

output "yandex_storage_bucket_secret_key" {
  value     = yandex_storage_bucket.this.secret_key
  sensitive = true
}

output "yandex_storage_bucket_name" {
  value     = yandex_storage_bucket.this.bucket
  sensitive = true
}
