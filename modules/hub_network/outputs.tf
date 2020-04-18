output "hub_vnet_name" {
  description = "The name of the Hub vNet that is created."
  value       = azurerm_virtual_network.vnet.name
}

output "hub_vnet_rg" {
  description = "The name of resource group the Hub vNet that is created in."
  value       = azurerm_resource_group.vnet_rg.name
}

output "hub_vnet_id" {
  description = "The ID of the Hub vNet that is created."
  value       = data.azurerm_virtual_network.vnet.id
}

output "firewall_private_ip" {
  description = "The Private IP of the Azure Firewall that is created"
  value       = azurerm_firewall.firewall.ip_configuration[0].private_ip_address
}