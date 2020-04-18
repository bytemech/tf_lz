resource "azurerm_subnet" "firewall" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = azurerm_resource_group.vnet_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefix       = "10.1.3.192/27"
}


resource "azurerm_public_ip" "firewall" {
  name                = var.firewall_ip_name
  resource_group_name  = azurerm_resource_group.vnet_rg.name
  location = azurerm_resource_group.vnet_rg.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall" "firewall" {
  name                 = var.firewall_name
  resource_group_name  = azurerm_resource_group.vnet_rg.name
  location = azurerm_resource_group.vnet_rg.location

  ip_configuration {
    name                 = var.firewall_ip_name
    subnet_id            = azurerm_subnet.firewall.id
    public_ip_address_id = azurerm_public_ip.firewall.id
  }
}