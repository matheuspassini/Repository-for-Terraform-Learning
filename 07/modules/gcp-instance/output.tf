output "ip" {
  value = google_compute_instance.vm[*].network_interface.0.access_config.*.nat_ip
}

output "id" {
  value = google_compute_instance.vm[*].id
}

output "vm_name" {
  value = google_compute_instance.vm[*].name
}