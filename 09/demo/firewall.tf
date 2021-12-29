data "google_compute_network" "network" {
  name = "network"
}

resource "google_compute_firewall" "ingress-allow" {
  name = "ingress-allow"
  network = data.google_compute_network.network.name
  source_ranges = ["0.0.0.0/0"]
  target_tags = [terraform.workspace]
  allow {
    protocol = "tcp"
    ports = ["22", "30000-40000"]
  }
}