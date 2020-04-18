
resource "azurerm_route" "default" {
  name                      = "Default"
  resource_group_name       = azurerm_resource_group.vnet_rg.name
  route_table_name          = azurerm_route_table.default.name
  address_prefix            = "0.0.0.0/0"
  next_hop_type             = "VirtualAppliance"
  next_hop_in_ip_address    = var.firewall_ip_address
}