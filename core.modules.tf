module "hub" {
  source = "./subscriptions/hub"
  providers = {
    azurerm.default = azurerm.hub
  }

  vnet_name          = "hub_vnet${random_id.hub.dec}"
  rg_name            = "vnet_rg${random_id.hub.dec}"
  location           = "ukwest"
  dns_servers        = ["1.1.1.1"]
  vpn_gw_sku         = "Standard"
  vpn_gw_ip_name     = "vpn_gw_ip${random_id.hub.dec}"
  firewall_name      = "firewall${random_id.hub.dec}"
  firewall_ip_name   = "firewall_ip${random_id.hub.dec}"
  bastion_ip_name    = "bastion_ip${random_id.hub.dec}"
  route_table_name   = "hub_vnet${random_id.hub.dec}"
  azure_ip_space     = "10.0.0.0/8"
  vnet_ip_space      = ["10.1.0.0/22"]
  workload_ip_subnet = "10.1.0.0/24"
  bastion_ip_subnet  = "10.1.3.192/27"
  gateway_ip_subnet  = "10.1.3.224/27"
  firewall_ip_subnet = "10.1.3.128/26"

  tags = {
    environment = "hub"
  }
}

resource "random_id" "hub" {
  byte_length = 4

  keepers = {
    location = var.location
  }
}

module "core" {
  source = "./subscriptions/core"
  providers = {
    azurerm.default = azurerm.core
  }

  vnet_name          = "core_vnet${random_id.core.dec}"
  rg_name            = "core_vnet${random_id.core.dec}"
  location           = var.location
  bastion_ip_name    = "bastion_ip${random_id.core.dec}"
  route_table_name   = "core_vnet${random_id.core.dec}"
  vnet_ip_space      = ["10.2.0.0/22"]
  workload_ip_subnet = "10.2.0.0/24"
  bastion_ip_subnet  = "10.2.3.160/27"

  tags = {
    environment = "core"
  }

  dns_servers         = module.hub.dns_servers
  firewall_ip_address = module.hub.firewall_private_ip
  hub_vnet_name       = module.hub.hub_vnet_name
  hub_vnet_rg         = module.hub.hub_vnet_rg
}

resource "random_id" "core" {
  byte_length = 4

  keepers = {
    location = var.location
  }
}
