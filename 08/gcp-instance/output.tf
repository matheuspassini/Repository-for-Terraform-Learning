output "name" {
  value = google_compute_instance.vm[*].name
}

output "instance_id" {
  value = google_compute_instance.vm[*].instance_id
}

output "cpu_platform" {
  value = google_compute_instance.vm[*].cpu_platform
}

output "external_ip" {
  value = google_compute_instance.vm[*].network_interface.0.access_config.0.nat_ip
}

output "internal_ip" {
  value = google_compute_instance.vm[*].network_interface.0.network_ip
}