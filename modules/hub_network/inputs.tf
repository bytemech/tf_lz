variable "vnet_name" {
  description = "Name of the hub virtual network to be created."
  type        = string
  default     = "hub-vnet"
}

variable "rg_name" {
  description = "Name of the hub network resource group to be created."
  type        = string
  default     = "hub_network"
}

variable "location" {
  description = "Name of the location for resources to be created in."
  type        = string
  default     = "ukwest"
}

variable "tags" {
  description = "Map of tags to apply to resources to be created."
  type        = map
  default = {
    environment = "hub"
  }
}
variable "dns_servers" {
  description = ""
  type        = list(string)
  default     = ["1.1.1.1", "1.0.0.1"]
}

variable "vpn_gw_sku" {
  description = "SKU for the VPN Gateway."
  type        = string
  default     = "Standard"
}

variable "vpn_gw_ip_name" {
  description = "Name for the VPN Gateway Public IPto be created."
  type        = string
  default     = "VPN_Gateway"
}

variable "firewall_name" {
  description = "Name for the Azure Firewall to be created."
  type        = string
  default     = "azure_firewall"
}

variable "firewall_ip_name" {
  description = "Name for the Azure Firewall Public IP to be created."
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

variable "azure_ip_space" {
  description = "The total Azure IP Address Space (CIDR Block) that needs to be reachable via the VPN Gateway."
  type        = string
  default     = "10.0.0.0/8"
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

variable "gateway_ip_subnet" {
  description = "IP Address Space (CIDR Block) for the Gateway Subnet to be created."
  type        = string
  default     = "10.1.3.224/27"
}

variable "firewall_ip_subnet" {
  description = "IP Address Space (CIDR Block) for the Azure Firewall Subnet to be created."
  type        = string
  default     = "10.1.3.128/26"
}