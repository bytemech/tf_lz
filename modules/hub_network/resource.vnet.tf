resource "azurerm_virtual_network" "vnet" {
  provider            = azurerm.default
  name                = var.vnet_name
  location            = azurerm_resource_group.vnet_rg.location
  resource_group_name = azurerm_resource_group.vnet_rg.name
  address_space       = var.vnet_ip_space
  dns_servers         = var.dns_servers
  tags                = var.tags
}

data "azurerm_virtual_network" "vnet" {
  provider            = azurerm.default
  depends_on          = [azurerm_virtual_network.vnet]
  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.vnet_rg.name
}