module "spoke1" {
  source = "./subscriptions/spoke"
  providers = {
    azurerm.default = azurerm.spoke
    azurerm.hub     = azurerm.hub
  }
  vnet_name          = "spoke_vnet${random_id.spoke.dec}"
  rg_name            = "spoke_vnet${random_id.spoke.dec}"
  bastion_ip_name    = "bastion_ip${random_id.spoke.dec}"
  route_table_name   = "spoke_vnet${random_id.spoke.dec}"
  vnet_ip_space      = ["10.3.0.0/22"]
  workload_ip_subnet = "10.3.0.0/24"
  bastion_ip_subnet  = "10.3.3.160/27"
  tags = {
    environment = "spoke"
  }

  location            = var.location
  dns_servers         = module.hub.dns_servers
  firewall_ip_address = module.hub.firewall_private_ip
  hub_vnet_name       = module.hub.hub_vnet_name
  hub_vnet_rg         = module.hub.hub_vnet_rg
  hub_vnet_id         = module.hub.hub_vnet_id
}

resource "random_id" "spoke" {
  byte_length = 4

  keepers = {
    location = var.location
  }
}
