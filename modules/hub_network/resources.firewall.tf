resource "azurerm_subnet" "firewall" {
  provider             = azurerm.default
  name                 = "AzureFirewallSubnet"
  resource_group_name  = azurerm_resource_group.vnet_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefix       = var.firewall_ip_subnet

  lifecycle {
    ignore_changes = [route_table_id]
    #Ignore changes to route table to avoid clearing this ID incorrectly. Provider version-specific bug. 
  }
}


resource "azurerm_public_ip" "firewall" {
  provider            = azurerm.default
  name                = var.firewall_ip_name
  resource_group_name = azurerm_resource_group.vnet_rg.name
  location            = azurerm_resource_group.vnet_rg.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall" "firewall" {
  provider            = azurerm.default
  name                = var.firewall_name
  resource_group_name = azurerm_resource_group.vnet_rg.name
  location            = azurerm_resource_group.vnet_rg.location

  ip_configuration {
    name                 = var.firewall_ip_name
    subnet_id            = azurerm_subnet.firewall.id
    public_ip_address_id = azurerm_public_ip.firewall.id
  }
}

resource "azurerm_firewall_network_rule_collection" "Allow_Outbound_Traffic" {
  provider            = azurerm.default
  name                = "Allow_Outbound_Traffic"
  azure_firewall_name = azurerm_firewall.firewall.name
  resource_group_name = azurerm_resource_group.vnet_rg.name
  priority            = 100
  action              = "Allow"

  rule {
    name = "testrule"

    source_addresses = [
      var.azure_ip_space,
    ]

    destination_ports = [
      "*",
    ]

    destination_addresses = [
      "*"
    ]

    protocols = [
      "Any"
    ]
  }
}