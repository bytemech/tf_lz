variable "tags" {
  description = "Map of tags to apply to resources to be created."
  type        = map
  default = {
    environment = "core"
  }
}

variable "location" {
  description = "Name of the location to create Azure Resources in."
  type        = string
}