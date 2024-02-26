variable "name" {
  description = "Static Site name"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group in which to create the Static Site resources"
  type        = string
}

variable "location" {
  description = "Location of the Static Site resources"
  type        = string
}

variable "sku" {
  description = "SKU size and tier of the static site"
  type        = string
  default     = "Free"

  validation {
    condition     = contains(["Free", "Standard"], var.sku)
    error_message = "SKU can only be 'Free' or 'Standard'"
  }
}

variable "identity" {
  description = "Custom identity settings for the Static Site"
  type = map(object({
    type = optional(string, "SystemAssigned")
    ids  = optional(list(string), [])
  }))
  default = {}
}

variable "app_settings" {
  description = "Map of the Static Site settings"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Map of the resource tags"
  type        = map(string)
  default     = {}
}

variable "custom_domains" {
  description = "Map of the custom domains for the Static Site"
  type        = map(string)
  default     = {}
}
