output "hub_vnet_id" {
    description = "The ID of the Hub vNet that is created"
    value = azurerm_virtual_network.vnet.id
}

output "firewall_private_ip" {
    description = "The Private IP of the Azure Firewall that is created"
    value = azurerm_firewall.firewall.ip_configuration[0].private_ip_address
}