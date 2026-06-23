variable "config" {
  description = "Contains all nat gateway configuration"
  type = object({
    name                    = string
    resource_group_name     = optional(string)
    location                = optional(string)
    sku_name                = optional(string)
    idle_timeout_in_minutes = optional(number)
    zones                   = optional(list(string))
    tags                    = optional(map(string))
    associations = optional(object({
      subnets = optional(map(object({
        subnet_id = string
      })), {})
      public_ips = optional(map(object({
        public_ip_address_id = string
      })), {})
      public_ip_prefixes = optional(map(object({
        public_ip_prefix_id = string
      })), {})
    }), {})
  })

  validation {
    condition     = var.config.location != null || var.location != null
    error_message = "Location must be provided either in the gateway object or as a separate variable."
  }

  validation {
    condition     = var.config.resource_group_name != null || var.resource_group_name != null
    error_message = "Resource group name must be provided either in the gateway object or as a separate variable."
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
