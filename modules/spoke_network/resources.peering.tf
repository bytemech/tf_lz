resource "azurerm_virtual_network_peering" "peering-to-hub" {
  provider                  = azurerm.default
  name                      = "hub-${var.hub_vnet_name}"
  resource_group_name       = azurerm_resource_group.vnet_rg.name
  virtual_network_name      = azurerm_virtual_network.vnet.name
  remote_virtual_network_id = var.hub_vnet_id
}


resource "azurerm_virtual_network_peering" "peering-from-hub" {
  provider                  = azurerm.hub
  name                      = "spoke-${azurerm_virtual_network.vnet.name}"
  resource_group_name       = var.hub_vnet_rg
  virtual_network_name      = var.hub_vnet_name
  remote_virtual_network_id = azurerm_virtual_network.vnet.id
}