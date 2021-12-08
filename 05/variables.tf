variable "vm_count" {
  type = number
  default = 4
}

variable "vm_name" {
  type = string
  default = "web"
}

variable "vm_type" {
  type = string
  default = "e2-micro"
}

variable "vm_zone" {
  type = string
  default = "us-central1-a"
}