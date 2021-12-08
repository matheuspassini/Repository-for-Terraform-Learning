resource "google_compute_firewall" "firewall1" {
  name = "firewall1"
  network = google_compute_network.vpc.self_link
  target_tags = ["admin"]

  allow {
    protocol = "tcp"
    ports = ["22"]
  }

  source_ranges = ["10.240.1.0/24"]
}

resource "google_compute_firewall" "firewall2" {
  name = "firewall2"
  network = google_compute_network.vpc.self_link
  target_tags = ["web"]

   allow {
    protocol = "tcp"
    ports = ["80"]
  }

  source_ranges = ["10.240.1.0/24"]
}