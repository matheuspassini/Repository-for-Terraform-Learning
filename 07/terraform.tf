terraform {
  required_providers {
    google = {
        source = "hashicorp/google"
        version = "4.1.0"
    }
  }

  backend "gcs" {
    bucket = "state_terraform"
    prefix = "terraform/state"
  }
}

provider "google" {
  
}