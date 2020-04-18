resource "azurerm_subnet" "bastion" {
  provider             = azurerm.default
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.vnet_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefix       = var.bastion_ip_subnet

  lifecycle {
    ignore_changes = [route_table_id]
    #Ignore changes to route table to avoid clearing this ID incorrectly. Provider version-specific bug. 
  }
}

resource "azurerm_public_ip" "bastion" {
  provider            = azurerm.default
  name                = var.bastion_ip_name
  resource_group_name = azurerm_resource_group.vnet_rg.name
  location            = azurerm_resource_group.vnet_rg.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion" {
  provider            = azurerm.default
  name                = "AzureBastion"
  location            = azurerm_resource_group.vnet_rg.location
  resource_group_name = azurerm_resource_group.vnet_rg.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.bastion.id
    public_ip_address_id = azurerm_public_ip.bastion.id
  }
}

