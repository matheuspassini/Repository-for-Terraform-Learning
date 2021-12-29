resource "google_compute_subnetwork" "subnet" {
  ip_cidr_range = var.cidr_range
  name          = var.subnet_name
  network       = var.vpc_name
  region = var.region
}