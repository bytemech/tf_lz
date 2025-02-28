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

variable "vm_name" {
  description = "Name of Virtual Machine to create."
  type        = string
}

variable "vm_size" {
  description = "Size of Virtual Machine to create."
  type        = string
  default     = "Standard_F2"
}

variable "ip_addr" {
  description = "IP address of Virtual Machine to create."
  type        = string
}

variable "subnet_id" {
  description = "ID of subnet to create virtual network interface in."
  type        = string
}

variable "key_vault_id" {
  description = "ID of the Keyvault to save the breakglass in. Must be in the same subscription."
}

variable "automation_account_dsc_server_endpoint" {
  description = "The DSC Server Endpoint of the Automation Account that is the DSC Pull Server."
}

variable "automation_account_dsc_access_key" {
  description = "The access key for the DSC Server Endpoint of the Automation Account that is the DSC Pull Server."
}

variable "automation_account_dsc_node_name" {
  description = "The node name to register with the DSC Server Endpoint of the Automation Account that is the DSC Pull Server."
}


