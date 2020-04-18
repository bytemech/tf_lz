resource "azurerm_subnet" "workload" {
  provider             = azurerm.default
  name                 = "WorkloadSubnet"
  resource_group_name  = azurerm_resource_group.vnet_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefix       = var.workload_ip_subnet
}

resource "azurerm_subnet_route_table_association" "workload" {
  provider       = azurerm.default
  subnet_id      = azurerm_subnet.workload.id
  route_table_id = azurerm_route_table.default.id
}