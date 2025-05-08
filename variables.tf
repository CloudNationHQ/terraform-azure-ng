variable "config" {
  description = "Contains all nat gateway configuration"
  type = object({
    name                    = string
    resource_group_name     = optional(string, null)
    location                = optional(string, null)
    sku_name                = optional(string, "Standard")
    idle_timeout_in_minutes = optional(number, 4)
    zones                   = optional(list(string), [])
    subnet_id               = string
    tags                    = optional(map(string))
    public_ip_associations = optional(map(object({
      public_ip_address_id = string
    })), {})
    public_ip_prefix_associations = optional(map(object({
      public_ip_prefix_id = string
    })), {})
  })

  validation {
    condition     = var.config.location != null || var.location != null
    error_message = "Location must be provided either in the config object or as a separate variable."
  }

  validation {
    condition     = var.config.resource_group_name != null || var.resource_group_name != null
    error_message = "Resource group name must be provided either in the config object or as a separate variable."
  }
}

variable "location" {
  description = "default azure region to be used."
  type        = string
  default     = null
}

variable "resource_group_name" {
  description = "default resource group to be used."
  type        = string
  default     = null
}

variable "tags" {
  description = "tags to be added to the resources"
  type        = map(string)
  default     = {}
}
