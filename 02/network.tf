resource "google_compute_network" "network" {
  name = "vpc-network"
  auto_create_subnetworks = true
}