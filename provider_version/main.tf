terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.1.0"
    }
  }
}

resource "random_integer" "name" {
  max = 100
  min = 0
}
