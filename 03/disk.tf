resource "google_compute_disk" "disk" {
  name = var.disk
  type = var.disk_type
  size = var.disk_size
  zone = var.zone
}