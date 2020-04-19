variable "rg_name" {
  description = "Name of the Resource Group to create Azure Resources in."
  type        = string
}

variable "location" {
  description = "Name of the location to create Azure Resources in."
  type        = string
}

variable "tags" {
  description = "Map of tags to apply to resources to be created."
  type        = map
}

variable "monitor_workspace_name" {
  description = "Name of the Log Analytics Workspace to be created."
  type        = string
}

variable "monitor_workspace_retention_days" {
  description = "Number of days for data to be retained in the Log Analytics Workspace to be created."
  type        = number
}

variable "automation_account_id" {
  description = "ID of an Automation Account to be linked to the Log Analytics Workspace to be created."
  type        = string
}