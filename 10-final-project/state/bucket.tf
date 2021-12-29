resource "google_storage_bucket" "bucket_final_project" {
  name = "bucket_final_project"
  project = "matheuspassini"
  location = "US"
  force_destroy = true
  versioning {
    enabled = true
  }
}