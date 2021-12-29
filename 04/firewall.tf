resource "google_compute_firewall" "firewall" {
  name = var.firewall_name
  network = google_compute_network.vpc1.self_link

  allow {
    protocol = "tcp"
    ports = ["80"]
  }

  source_ranges = ["10.240.1.0/24"]
  target_tags = ["web"]
}