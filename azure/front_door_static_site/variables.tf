variable "resource_group_name" {
  type        = string
  description = "Azure Resource Group name"

  validation {
    condition     = can(regex("^[a-zA-Z0-9-_.]{1,90}$", var.resource_group_name))
    error_message = "Resource group name must be 1–90 characters. Only letters, numbers, hyphens, underscores, and periods are allowed."
  }
}

variable "frontdoor_profile_name" {
  type        = string
  description = "Name of the Front Door profile"

  validation {
    condition     = length(var.frontdoor_profile_name) >= 1 && length(var.frontdoor_profile_name) <= 90
    error_message = "Front Door profile name must be between 1 and 90 characters."
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

variable "origins" {
  type = list(object({
    name                             = string
    host_name                        = string
    origin_host_header               = optional(string)
    priority                         = optional(number)
    weight                           = optional(number)
    enabled                          = optional(bool)
    https_port                       = optional(number)
    http_port                        = optional(number)
    certificate_name_check_enabled   = optional(bool)
  }))
  description = "List of origins. Must include at least one."

  validation {
    condition     = length(var.origins) > 0
    error_message = "At least one origin must be defined in the origins list."
  }
}

variable "health_probe" {
  type = object({
    path                = string
    protocol            = string
    request_type        = string
    interval_in_seconds = number
  })
  default = {
    path                = "/"
    protocol            = "Https"
    request_type        = "GET"
    interval_in_seconds = 240
  }

  validation {
    condition     = contains(["Http", "Https"], var.health_probe.protocol)
    error_message = "Health probe protocol must be either 'Http' or 'Https'."
  }
}

variable "load_balancing" {
  type = object({
    sample_size                        = number
    successful_samples_required        = number
    additional_latency_in_milliseconds = number
  })
  default = {
    sample_size                        = 4
    successful_samples_required        = 3
    additional_latency_in_milliseconds = 0
  }

  validation {
    condition     = var.load_balancing.sample_size >= 1 && var.load_balancing.successful_samples_required >= 1
    error_message = "Sample size and successful sample count must be ≥ 1."
  }
}
