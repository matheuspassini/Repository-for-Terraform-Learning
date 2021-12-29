resource "google_compute_instance" "machines" {
  count = var.vm_number
  name = format("%s-%s-%s", terraform.workspace, var.vm, count.index)
  machine_type = var.vm_type
  zone = var.zone
  tags = ["admin", "web"]

  labels = {
    "" = "value"
  }

  boot_disk {
    initialize_params {
        image = "debian-cloud/debian-10"
    }
  }
  
  network_interface {
    subnetwork = google_compute_subnetwork.subnet.self_link
  }
}