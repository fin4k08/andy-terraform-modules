variable "location" {
  description = "The Azure Region in which all resources groups should be created."
  type        = string

  validation {
    condition     = contains(["uksouth", "westeurope", "ukwest"], lower(var.location))
    error_message = "Invalid location. Must be one of; uksouth, westeurope, ukwest."
  }

}
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string

  validation {
    condition     = length(var.resource_group_name) > 0
    error_message = "Resource group name must not be empty."
  }
}