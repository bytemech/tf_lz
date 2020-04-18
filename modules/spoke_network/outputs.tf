output "spoke_vnet_id" {
  description = "The ID of the Hub vNet that is created"
  value       = azurerm_virtual_network.vnet.id
}
