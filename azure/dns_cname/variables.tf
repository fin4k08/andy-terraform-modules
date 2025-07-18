variable "record_name" {
  description = "CNAME record name (subdomain)"
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9-]+$" , var.record_name))
    error_message = "record_name must only contain alphanumeric characters or hyphens."
  }
}

variable "zone_name" {
  description = "DNS zone name (e.g., example.com)"
  type        = string

  validation {
    condition     = can(regex("^([a-zA-Z0-9][-a-zA-Z0-9]*\\.)+[a-zA-Z]{2,}$", var.zone_name))
    error_message = "zone_name must be a valid domain (e.g., example.com)."
  }
}

variable "resource_group_name" {
  description = "Resource group where the DNS zone is hosted"
  type        = string

  validation {
    condition     = length(var.resource_group_name) > 1
    error_message = "resource_group_name must be at least 2 characters long."
  }
}

variable "ttl" {
  description = "TTL in seconds for the CNAME record"
  type        = number
  default     = 600

  validation {
    condition     = var.ttl >= 60 && var.ttl <= 86400
    error_message = "TTL must be between 60 and 86400 seconds."
  }
}

variable "target_resource_id" {
  description = "Target Azure resource ID for the CNAME"
  type        = string

  validation {
    condition     = can(regex("^/subscriptions/.+/resourceGroups/.+/providers/.+/.+/.+$", var.target_resource_id))
    error_message = "Must be a valid Azure Resource ID."
  }
}
