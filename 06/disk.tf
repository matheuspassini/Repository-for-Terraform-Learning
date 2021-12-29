resource "google_compute_disk" "disk_a" {
  count = var.disk_number
  name = format("disk_a-%s", count.index)
  type = var.disk_type
  size = 20
  zone = var.zone
}

resource "google_compute_attached_disk" "attached_disk_a" {
  disk = google_compute_disk.disk_a[var.disk_number].self_link
  instance = google_compute_instance.machines[0-4].self_link
}

resource "google_compute_disk" "disk_b" {
  count = var.disk_number
  name = format("disk_a-%s", count.index)
  type = var.disk_type
  size = 40
  zone = var.zone
}

resource "google_compute_attached_disk" "attached_disk_b" {
  disk = google_compute_disk.disk_b[var.disk_number].self_link
  instance = google_compute_instance.machines[5-9].self_link
}