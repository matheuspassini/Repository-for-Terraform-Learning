variable "name" {
  type        = string
}

variable "base_instance_name" {
  type        = string
}

variable "region" {
  type        = string
}

variable "distribution_policy_zones" {
  type        = list(string)
}

variable "instance_template" {
  type        = string
}

variable "resource_depends_on" {
  type        = any
  default     = null
}