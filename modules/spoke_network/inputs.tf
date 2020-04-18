variable "vnet_name" {
    description = "Name of the hub virtual network to be created."
    type = string
    default = "hub-vnet"
}

variable "rg_name" {
    description = "Name of the hub network resource group to be created."
    type = string
    default = "hub_network"
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
        environment = "hub"
    }
}

variable "vpn_gw_sku" {
    description = "SKU for the VPN Gateway."
    type = string
    default = "VpnGw1AZ"
}

variable "vpn_gw_ip_name" {
    description = "Name for the VPN Gateway Public IPto be created."
    type = string
    default = "VPN_Gateway"
}


variable "firewall_ip" {
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