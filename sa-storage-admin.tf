## Create SA sa-storage-admin
resource "yandex_iam_service_account" "sa-storage-admin" {
  folder_id = var.folder_id
  name      = var.service_account_name
}

## Grant permissions 
resource "yandex_resourcemanager_folder_iam_member" "sa-storage-admin" {
  folder_id = var.folder_id
  role      = "storage.admin"
  member    = "serviceAccount:${yandex_iam_service_account.sa-storage-admin.id}"
}
