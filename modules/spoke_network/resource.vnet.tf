resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.vnet_rg.location
  resource_group_name = azurerm_resource_group.vnet_rg.name
  address_space       = ["10.1.0.0/22"]
  dns_servers         = ["10.1.0.10", "10.1.0.11"]
  tags = var.tags
}