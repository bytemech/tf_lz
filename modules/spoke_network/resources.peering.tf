resource "azurerm_virtual_network_peering" "peering-to-hub" {
  provider                     = azurerm.default
  name                         = "hub-${var.hub_vnet_name}"
  resource_group_name          = azurerm_resource_group.vnet_rg.name
  virtual_network_name         = azurerm_virtual_network.vnet.name
  remote_virtual_network_id    = var.hub_vnet_id
  allow_virtual_network_access = true
  allow_gateway_transit        = false
  use_remote_gateways          = true
  allow_forwarded_traffic      = true

  lifecycle {
    ignore_changes = [remote_virtual_network_id]
    #Ignored to prevent issue of deleting and recreating peer. Provider version-specific bug. 
  }

  depends_on = [azurerm_virtual_network_peering.peering-from-hub]
  #Ensure one side of the connection is initiated first. 
}


resource "azurerm_virtual_network_peering" "peering-from-hub" {
  provider                     = azurerm.hub
  name                         = "spoke-${azurerm_virtual_network.vnet.name}"
  resource_group_name          = var.hub_vnet_rg
  virtual_network_name         = var.hub_vnet_name
  remote_virtual_network_id    = azurerm_virtual_network.vnet.id
  allow_virtual_network_access = true
  allow_gateway_transit        = true
  allow_forwarded_traffic      = false
}

