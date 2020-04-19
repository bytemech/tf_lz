variable "monitor_rg_name" {
  description = "Name of the Resource Group to create Azure Resources in."
  type        = string
}

variable "monitor_workspace_name" {
  description = "Name of the Log Analytics Workspace to be created."
  type        = string
}

variable "monitor_workspace_retention_days" {
  description = "Number of days for data to be retained in the Log Analytics Workspace to be created."
  type        = number
}