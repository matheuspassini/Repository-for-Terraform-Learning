resource "google_compute_instance" "this" {
  count = var.amount
  name = format("%s-%s-%d", terraform.workspace, var.name, count.index)
  machine_type = var.machine_type
  zone = var.zone
  tags = [ terraform.workspace ]

  metadata = {
    ssh-key = join("\n", [for key in var.ssh-key : "${key.user}:${key.publickey}"])
  }

  boot_disk {
    initialize_params {
      image = var.image
    }
  }
  network_interface {
    network = var.network
    access_config {}
  }

  metadata_startup_script = "./scripts/us.sh"
}
