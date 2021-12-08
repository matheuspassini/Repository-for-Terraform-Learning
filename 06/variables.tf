variable "vpc_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "vm_number" {
  type = number
}

variable "vm" {
  type = string
  default = "vm"
}

variable "vm_type" {
  type = string
}

variable "disk_number" {
  type = number
  default = 3
}

variable "disk_type" {
  type = string
}