variable "name" {
  description = "Name of the TXT record (e.g., asuid.www)"
  type        = string
}

variable "zone_name" {
  description = "The DNS zone name (e.g., example.com)"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "ttl" {
  description = "TTL of the DNS record"
  type        = number
  default     = 3600
}

variable "records" {
  type        = list(string)
  description = "One or more TXT record values."

  validation {
    condition     = length(var.records) > 0
    error_message = "At least one TXT record value is required."
  }
}

