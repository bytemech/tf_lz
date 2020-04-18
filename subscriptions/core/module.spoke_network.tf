module "spoke_network" {
  source = "../../modules/spoke_network"

  providers = {
    azurerm.default = azurerm.default
    azurerm.hub = azurerm.hub
  }
  
  vnet_name = var.vnet_name
  rg_name = var.rg_name
  location = var.location
  tags = var.tags
  dns_servers = var.dns_servers
  firewall_ip_address = var.firewall_ip_address
  bastion_ip_name = var.bastion_ip_name
  route_table_name = var.route_table_name
  hub_vnet_id = var.hub_vnet_id
}