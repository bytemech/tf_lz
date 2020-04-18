module "spoke_network1" {
  source = "../../modules/spoke_network"

  providers = {
    azurerm.default = azurerm.default
    azurerm.hub = azurerm.hub
  }
  
  vnet_name = var.vnet_name
  rg_name = var.rg_name
  location = var.location
  tags = var.tags
  dns_servers = module.hub.dns_servers
  firewall_ip_address = module.hub.firewall_ip_address
  bastion_ip_name = var.bastion_ip_name
  route_table_name = var.route_table_name
  hub_vnet_id = module.hub.hub_vnet_id
}

resource "random_id" "spoke1" {
  byte_length = 4
}
