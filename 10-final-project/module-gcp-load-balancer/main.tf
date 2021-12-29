resource "google_compute_global_forwarding_rule" "default" {
  name   = "global-users"
  target = google_compute_target_http_proxy.default.self_link
}

resource "google_compute_target_http_proxy" "default" {
  name    = "target-proxy"
  url_map = google_compute_url_map.default.self_link
}

resource "google_compute_url_map" "default" {
  name = "url-map-target-proxy"
  default_service = google_compute_backend_service.default.self_link
}

resource "google_compute_backend_service" "default" {
  name = "backend"
  port_name = "http"
  protocol = "HTTP"
  timeout_sec = 10
  health_checks = [google_compute_http_health_check.default.self_link]

  dynamic "backend" {
    for_each = var.backends
    content {
      group                 = backend.value
      balancing_mode        = var.balancing_mode
      max_rate_per_instance = 1
    }
  }
}

resource "google_compute_http_health_check" "default" {
  name = "backend"
  project  = "matheuspassini"
  request_path = "/"
  check_interval_sec = 1
  timeout_sec = 1
}