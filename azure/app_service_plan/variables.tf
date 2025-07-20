variable "name" {
  description = "The name of the App Service Plan"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "The resource group name"
  type        = string
}

variable "os_type" {
  description = "The OS type for the plan (Linux or Windows)"
  type        = string
  default     = "Linux"
}

variable "sku_name" {
  description = "The SKU for the App Service Plan"
  type        = string
  default     = "Y1" # Y1 = Dynamic (Consumption Plan)
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {}
}
