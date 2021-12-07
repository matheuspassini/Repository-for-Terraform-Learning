resource "google_compute_disk" "disk" {
  name = "disk"
  type = "pd-ssd"
  size = 30
  zone = "us-central1-a"
}