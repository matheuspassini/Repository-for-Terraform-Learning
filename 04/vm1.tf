resource "google_compute_instance" "vm1" {
  name = var.vm[0]
  machine_type = var.machine_type
  zone = var.zone
  tags = ["web"]

  boot_disk {
    initialize_params {
        image = var.bootdisk[0]
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet.self_link
    access_config {
      
    }
  }

  depends_on = [
    google_compute_subnetwork.subnet
  ]
}