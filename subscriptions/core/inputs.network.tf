variable "vnet_name" {
  description = "Name of the hub virtual network to be created."
  type        = string
  default     = "spoke-vnet"
}

variable "rg_name" {
  description = "Name of the hub network resource group to be created."
  type        = string
  default     = "spoke_network"
}

variable "dns_servers" {
  description = ""
  type        = list(string)
  default     = ["1.1.1.1", "1.0.0.1"]
}

variable "firewall_ip_address" {
  description = "IP to be set as the default route"
  type        = string
  default     = "azure_firewall_ip"
}

variable "bastion_ip_name" {
  description = "Name for the Azure Bastion Public IP to be created."
  type        = string
  default     = "bastion_ip"
}

variable "route_table_name" {
  description = "Name for the Azure Route Table to be created."
  type        = string
  default     = "hub_route_table"
}

variable "hub_vnet_name" {
  description = "Name of the Hub Virtual Network."
  type        = string
  default     = ""
}

variable "hub_vnet_rg" {
  description = "Name of the Hub Virtual Network's Resource Group."
  type        = string
  default     = ""
}

variable "hub_vnet_id" {
  description = "ID of the Hub Virtual Network."
  type        = string
}

variable "vnet_ip_space" {
  description = "IP Address Space (CIDR Block) for the Virtual Network to be created."
  type        = list(string)
  default     = ["10.1.0.0/22"]
}

variable "workload_ip_subnet" {
  description = "IP Address Space (CIDR Block) for the Workload Subnet to be created."
  type        = string
  default     = "10.1.0.0/24"
}

variable "bastion_ip_subnet" {
  description = "IP Address Space (CIDR Block) for the Azure Bastion Subnet to be created."
  type        = string
  default     = "10.1.3.192/27"
}