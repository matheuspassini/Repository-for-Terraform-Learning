variable "disk" {
  type = string
}

variable "disk_type" {
  type = string
}

variable "disk_size" {
  type = number
}

variable "vm_name" {
  type = list(string)
}

variable "machine_type" {
  type = string
}

variable "zone" {
  type = string
}

variable "firewall_name" {
  type = string
}

variable "vpc_name" {
  type = string
}
