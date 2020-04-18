module "spoke_network1" {
  source = "../../modules/spoke_network"

  providers = {
    azurerm.default = azurerm.default
    azurerm.hub     = azurerm.hub
  }

  vnet_name           = var.vnet_name
  rg_name             = var.rg_name
  location            = var.location
  tags                = var.tags
  dns_servers         = var.dns_servers
  firewall_ip_address = var.firewall_ip_address
  bastion_ip_name     = var.bastion_ip_name
  route_table_name    = var.route_table_name
  hub_vnet_name       = var.hub_vnet_name
  hub_vnet_rg         = var.hub_vnet_rg
  vnet_ip_space       = var.vnet_ip_space
  workload_ip_subnet  = var.workload_ip_subnet
  bastion_ip_subnet   = var.bastion_ip_subnet
}

