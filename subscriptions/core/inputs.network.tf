variable "vnet_name" {
    description = "Name of the hub virtual network to be created."
    type = string
    default = "spoke-vnet"
}

variable "rg_name" {
    description = "Name of the hub network resource group to be created."
    type = string
    default = "spoke_network"
}

variable "location" {
    description = "Name of the location for resources to be created in."
    type = string
    default = "ukwest"
}

variable "tags" {
    description = "Map of tags to apply to resources to be created."
    type = map
    default = {
        environment = "spoke"
    }
}

variable "dns_servers" {
    description = ""
    type = list(string)
    default = ["1.1.1.1","1.0.0.1"]
}

variable "firewall_ip_address" {
    description = "IP to be set as the default route"
    type = string
    default = "azure_firewall_ip"
}

variable "bastion_ip_name" {
    description = "Name for the Azure Bastion Public IP to be created."
    type = string
    default = "bastion_ip"
}

variable "route_table_name" {
    description = "Name for the Azure Route Table to be created."
    type = string
    default = "hub_route_table"
}

variable "hub_vnet_id" {
    description = "Resource ID of the Hub Virtual Network."
    type = string
    default = ""
}