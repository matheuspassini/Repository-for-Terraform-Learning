variable "vpc_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "region" {
  type = string
}

variable "vm" {
  type = list(string)
}

variable "machine_type" {
  type = string
}

variable "zone" {
  type = string
}

variable "disk_name" {
  type = list(string)
}

variable "firewall_name" {
  type = string
}

variable "bootdisk" {
  type = list(string)
}