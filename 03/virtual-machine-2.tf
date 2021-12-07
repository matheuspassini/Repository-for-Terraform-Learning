resource "google_compute_instance" "vm2" {
  name = var.vm_name[1]
  machine_type = var.machine_type
  zone = var.zone

  boot_disk {
    initialize_params {
        image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = google_compute_network.vpc.name
    access_config {
      
    }
  }
}