resource "google_compute_subnetwork" "subnet" {
  name = var.subnet_name
  ip_cidr_range = "10.240.1.0/24"
  network = google_compute_network.vpc1.self_link
  region = var.region
}

resource "google_compute_network" "vpc1" {
  name = var.vpc_name
  auto_create_subnetworks = false
}