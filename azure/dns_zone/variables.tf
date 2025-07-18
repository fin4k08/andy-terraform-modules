variable "zone_name" {
  description = "The DNS zone (e.g., example.com)"
  type        = string

    validation {
    condition     = can(regex("^([a-zA-Z0-9][-a-zA-Z0-9]*\\.)+[a-zA-Z]{2,}$", var.zone_name))
    error_message = "Must be a valid domain name (e.g., example.com)."
  }
}

variable "resource_group_name" {
  description = "The resource group name"
  type        = string

    validation {
    condition     = length(var.resource_group_name) > 1
    error_message = "resource_group_name must be at least 2 characters long."
  }
}
