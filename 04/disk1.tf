resource "google_compute_disk" "disk1" {
  name = var.disk_name[0]
  type = "pd-ssd"
  size = 20
  zone = var.zone
}

resource "google_compute_attached_disk" "disk1" {
  disk = google_compute_disk.disk1.self_link
  instance = google_compute_instance.vm1.self_link
}