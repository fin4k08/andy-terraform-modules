variable "name" {
  description = "Name of the Front Door custom domain resource"
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9-]{1,80}$", var.name))
    error_message = "Name must be 1–80 characters long and only include alphanumeric characters and hyphens."
  }
}

variable "profile_id" {
  description = "Front Door profile resource ID"
  type        = string

  validation {
    condition     = can(regex("^/subscriptions/.+/resourceGroups/.+/providers/Microsoft.Cdn/profiles/.+$", var.profile_id))
    error_message = "profile_id must be a valid Azure Front Door profile resource ID."
  }
}

variable "host_name" {
  description = "The fully qualified domain name (FQDN) (e.g. www.example.com)"
  type        = string

  validation {
    condition     = can(regex("^([a-zA-Z0-9][-a-zA-Z0-9]*\\.)+[a-zA-Z]{2,}$", var.host_name))
    error_message = "host_name must be a valid fully qualified domain name (e.g. www.example.com)."
  }
}

variable "certificate_type" {
  description = "TLS certificate type for custom domain"
  type        = string
  default     = "ManagedCertificate"

  validation {
    condition     = contains(["ManagedCertificate", "CustomerCertificate"], var.certificate_type)
    error_message = "certificate_type must be either 'ManagedCertificate' or 'CustomerCertificate'."
  }
}
variable "endpoint_name" {
  type        = string
  description = "Name of the Front Door endpoint"

  validation {
    condition     = can(regex("^[a-zA-Z0-9-]{1,90}$", var.endpoint_name))
    error_message = "Endpoint name must be 1–90 characters, letters, numbers, and hyphens only."
  }
}
variable "endpoint_id" {
  description = "The ID of the Front Door endpoint"
  type        = string
}

variable "origin_group_id" {
  description = "The ID of the Front Door origin group"
  type        = string
}

variable "origin_ids" {
  description = "List of origin resource IDs"
  type        = list(string)
}