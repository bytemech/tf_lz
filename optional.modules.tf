module "spoke" {
  source    = "./subscriptions/core"
  providers = {
    azurerm.default = azurerm.spoke
    azurerm.hub = azurerm.hub
  }
  vnet_name = "core_vnet${random_id.core.dec}"
  rg_name = "core_vnet${random_id.core.dec}"
  location = var.location
  bastion_ip_name = "bastion_ip${random_id.core.dec}"
  route_table_name = "core_vnet${random_id.core.dec}"
  dns_servers = module.hub.dns_servers
  firewall_ip_address = module.hub.firewall_private_ip
  hub_vnet_id = module.hub.hub_vnet_id

  tags = {
    environment = "spoke"
  }
}