module "hub" {
  source    = "./subscriptions/hub"
  providers = {
    azurerm.default = azurerm.hub
  }

    vnet_name = "hub_vnet${random_id.hub.dec}"
    rg_name = "vnet_rg${random_id.hub.dec}"
    location = "ukwest"
    dns_servers = ["1.1.1.1"]
    vpn_gw_sku = "VpnGw1AZ"
    vpn_gw_ip_name = "vpn_gw_ip${random_id.hub.dec}"
    firewall_name = "firewall${random_id.hub.dec}"
    firewall_ip_name = "firewall_ip${random_id.hub.dec}"
    bastion_ip_name = "bastion_ip${random_id.hub.dec}"
    route_table_name = "hub_vnet${random_id.hub.dec}"

    tags = {
      environment = "hub"
    }
}

resource "random_id" "hub" {
  byte_length = 4
}

module "core" {
  source    = "./subscriptions/core"
  providers = {
    azurerm.default = azurerm.core
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
    environment = "core"
  }
}

resource "random_id" "core" {
  byte_length = 4
}
