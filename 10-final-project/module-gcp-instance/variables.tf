variable "name" {
  type        = string
}

variable "machine_type" {
  type        = string
  default     = "f1-micro"
}

variable "instance_description" {
  default = ""
  type        = string
}

variable "labels" {
  type        = map
  default     = {}
}

variable "tags" {
  type        = list
  default     = []
}

variable "can_ip_forward" {
  type        = bool
  default     = false
}

variable "network" {
  type        = string
}

variable "subnetwork" {
  type        = string
}

variable "metadata_startup_script" {
  type        = string
  default      = null
}

variable "on_host_maintenance" {
  type        = string
  default     = "MIGRATE"
}

variable "automatic_restart" {
  type        = bool
  default     = true
}

variable "source_image" {
  type        = string
  default     = "debian-cloud/debian-10"
}

variable "auto_delete" {
  type        = bool
  default     = true
}

variable "boot" {
  type        = bool
  default     = true
}

variable "ssh_keys" {
  type = list(object({

    publickey = string
    user = string

  }))

  default = [
      {
        user = "username"
        publickey = "ssh-rsa yourkeyabc username@PC"
      }
  ]
}