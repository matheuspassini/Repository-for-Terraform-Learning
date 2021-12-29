output "master_instance_id" {
  value = google_compute_instance.this[*].instance_id
}

output "master_cpu_platform" {
  value = google_compute_instance.this[*].cpu_platform
}

output "master_external_ip" {
  value = google_compute_instance.this[*].network_interface.0.access_config.0.nat_ip
}

output "master_internal_ip" {
  value = google_compute_instance.this[*].network_interface.0.network_ip
}

output "master_self_link" {
  value = google_compute_instance.this[*].self_link
}