variable "rg_name" {
  description = "Name of the Resource Group to create Azure Resources in."
  type        = string
}

variable "location" {
  description = "Name of the location to create Azure Resources in."
  type        = string
}

variable "automation_account_name" {
  description = "Name of the Automation Account to be created."
  type        = string
}

variable "tags" {
  description = "Map of tags to apply to resources to be created."
  type        = map
}