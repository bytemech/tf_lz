resource "azurerm_virtual_network_peering" "peering" {
  count = var.hub_vnet_id != "" ? 1 : 0
  name                         = "Hub-${azurerm_virtual_network.vnet.name}"
  resource_group_name          = azurerm_resource_group.vnet_rg.name
  virtual_network_name         = azurerm_virtual_network.vnet.name
  remote_virtual_network_id    = var.hub_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

  # `allow_gateway_transit` must be set to false for vnet Global Peering
  allow_gateway_transit = false
}