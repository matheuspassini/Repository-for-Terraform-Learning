resource "google_storage_bucket" "state" {
  name =  "state_terraform"
  location = "US"
  force_destroy = true
  versioning {
    enabled = true
  }
}