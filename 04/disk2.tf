resource "google_compute_disk" "disk2" {
  name = var.disk_name[1]
  type = "pd-ssd"
  size = 40
  zone = var.zone
}

resource "google_compute_attached_disk" "disk2" {
  disk = google_compute_disk.disk2.self_link
  instance = google_compute_instance.vm2.self_link
}