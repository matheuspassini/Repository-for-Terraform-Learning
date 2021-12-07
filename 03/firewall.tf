resource "google_compute_firewall" "firewall" {
  name = var.firewall_name
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports = ["80", "8080", "22", "3389"]

  }

  source_ranges = ["0.0.0.0/0"]
  depends_on = [
    google_compute_network.vpc
  ]
}