resource "google_compute_firewall" "firewall" {
  name = "firewall-1"
  network = google_compute_network.network.name

  allow {
    protocol = "tcp"
    ports = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  depends_on = [
    google_compute_network.network
  ]

}