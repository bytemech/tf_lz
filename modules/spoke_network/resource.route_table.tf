resource "azurerm_route_table" "default" {
  name                          = var.route_table_name
  location                      = azurerm_resource_group.vnet_rg.location
  resource_group_name           = azurerm_resource_group.vnet_rg.name
  disable_bgp_route_propagation = true

  tags = var.tags

}