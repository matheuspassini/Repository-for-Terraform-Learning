variable "amount" {
  type        = number
  default     = 1
}

variable "name" {
  type        = string
  default = "vm"
}

variable "machine_type" {
  type        = string
  default     = "e2-micro"
}

variable "zone" {
  type        = string
  default     = "us-central1-a"
}

variable "image" {
  type        = string
  default     = "debian-cloud/debian-9"
}

variable "network" {
  type        = string
  default     = "default"
}

variable "subnetwork" {
  type = string
  default = "default"
}