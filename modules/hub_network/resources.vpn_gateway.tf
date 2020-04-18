resource "azurerm_subnet" "vpn_gw" {
  provider             = azurerm.default
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.vnet_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefix       = var.gateway_ip_subnet
}

resource "azurerm_route_table" "vpn_gw" {
  provider                      = azurerm.default
  name                          = "GatewaySubnet"
  location                      = azurerm_resource_group.vnet_rg.location
  resource_group_name           = azurerm_resource_group.vnet_rg.name
  disable_bgp_route_propagation = true

  tags = var.tags
}

resource "azurerm_subnet_route_table_association" "vpn_gw" {
  provider       = azurerm.default
  subnet_id      = azurerm_subnet.vpn_gw.id
  route_table_id = azurerm_route_table.vpn_gw.id
}

resource "azurerm_route" "firewall" {
  provider               = azurerm.default
  name                   = var.firewall_name
  resource_group_name    = azurerm_resource_group.vnet_rg.name
  route_table_name       = azurerm_route_table.default.name
  address_prefix         = var.azure_ip_space
  next_hop_type          = "VirtualAppliance"
  next_hop_in_ip_address = azurerm_firewall.firewall.ip_configuration[0].private_ip_address
}

resource "azurerm_public_ip" "vpn_gw" {
  provider            = azurerm.default
  name                = var.vpn_gw_ip_name
  location            = azurerm_resource_group.vnet_rg.location
  resource_group_name = azurerm_resource_group.vnet_rg.name
  sku                 = "Basic"
  allocation_method   = "Dynamic"
  tags                = var.tags
}

resource "azurerm_virtual_network_gateway" "vpn_gw" {
  provider            = azurerm.default
  name                = var.vpn_gw_ip_name
  location            = azurerm_resource_group.vnet_rg.location
  resource_group_name = azurerm_resource_group.vnet_rg.name

  active_active = false
  enable_bgp    = false
  sku           = var.vpn_gw_sku
  type          = "Vpn"

  ip_configuration {
    name                          = var.vpn_gw_ip_name
    public_ip_address_id          = azurerm_public_ip.vpn_gw.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.vpn_gw.id
  }

  tags = var.tags
}

