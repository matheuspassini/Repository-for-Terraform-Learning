terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.79.0"
    }
  }

  backend "gcs" {
    bucket = "bucket_final_project"
    prefix = "terraform/state"
  }
}

provider "google" {
  project   = "matheuspassini"
}