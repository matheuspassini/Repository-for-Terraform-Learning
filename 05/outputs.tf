output "ip" {
  value = google_compute_instance.web[*].network_interface.0.access_config.0.nat_ip
}

output "id" {
  value = google_compute_instance.web[*].id
}

output "vm_name" {
  value = google_compute_instance.web[*].name
}