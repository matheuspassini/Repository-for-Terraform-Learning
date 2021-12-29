resource "google_compute_subnetwork" "subnet" {
  name = var.subnet_name
  ip_cidr_range = "10.240.1.0/24"
  region = var.region
  network = google_compute_network.vpc.self_link
}