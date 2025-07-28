variable "profile_id" {
  type        = string
  description = "The ID of the Azure Front Door profile."

  validation {
    condition     = length(var.profile_id) > 0
    error_message = "profile_id must not be empty."
  }
}

variable "endpoint_id" {
  type        = string
  description = "The ID of the Azure Front Door endpoint."

  validation {
    condition     = length(var.endpoint_id) > 0
    error_message = "endpoint_id must not be empty."
  }
}

variable "origin_group_id" {
  type        = string
  description = "The ID of the Azure Front Door origin group."

  validation {
    condition     = length(var.origin_group_id) > 0
    error_message = "origin_group_id must not be empty."
  }
}

variable "origin_ids" {
  type        = list(string)
  description = "List of Azure Front Door origin IDs."

  validation {
    condition     = length(var.origin_ids) > 0
    error_message = "origin_ids list must not be empty."
  }
}

variable "route_name" {
  type        = string
  description = "The name to assign to the Front Door route."

  validation {
    condition     = length(trim(var.route_name)) > 0
    error_message = "route_name must not be empty or just whitespace."
  }
}

variable "custom_domain_name" {
  type        = string
  description = "The name of the Front Door custom domain resource."

  validation {
    condition     = length(trim(var.custom_domain_name)) > 0
    error_message = "custom_domain_name must not be empty."
  }
}

variable "custom_domain_hostname" {
  type        = string
  description = "The hostname of the custom domain (e.g., www.example.com)."

  validation {
    condition     = can(regex("^([a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,}$", var.custom_domain_hostname))
    error_message = "custom_domain_hostname must be a valid hostname (e.g., www.example.com)."
  }
}

variable "certificate_type" {
  type        = string
  description = "The type of certificate to use for TLS. Valid values: ManagedCertificate, CustomerCertificate."
  default     = "ManagedCertificate"

  validation {
    condition     = contains(["ManagedCertificate", "CustomerCertificate"], var.certificate_type)
    error_message = "certificate_type must be either 'ManagedCertificate' or 'CustomerCertificate'."
  }
}
