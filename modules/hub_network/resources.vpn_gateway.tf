resource "azurerm_subnet" "vpn_gw" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.vnet_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefix       = "10.1.3.224/27"
}

resource "azurerm_subnet_route_table_association" "vpn_gw" {
  subnet_id      = azurerm_subnet.vpn_gw.id
  route_table_id = azurerm_route_table.default.id
}

resource "azurerm_public_ip" "vpn_gw" {
  name                = var.vpn_gw_ip_name
  location            = azurerm_resource_group.vnet_rg.location
  resource_group_name = azurerm_resource_group.vnet_rg.name
  sku = "Standard"
  allocation_method = "Static"
  tags = var.tags
}

resource "azurerm_virtual_network_gateway" "vpn_gw" {
  name = "test"
  location = azurerm_resource_group.vnet_rg.location
  resource_group_name = azurerm_resource_group.vnet_rg.name

  active_active = false 
  enable_bgp = false
  sku = var.vpn_gw_sku
  type = "Vpn"

  ip_configuration {
    name = var.vpn_gw_ip_name
    public_ip_address_id = azurerm_public_ip.vpn_gw.id
    private_ip_address_allocation = "Dynamic"
    subnet_id = azurerm_subnet.vpn_gw.id
  }
  
  tags = var.tags
}