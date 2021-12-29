variable "name" {
  type = string
}

variable "auto_create_subnetworks" {
  type = bool
  default = true
}

variable "routing_mode" {
  type = string
  default = "REGIONAL"
}