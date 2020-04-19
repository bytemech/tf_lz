module "hub_network" {
  source = "../../modules/hub_network"

  providers = {
    azurerm.default = azurerm.default
  }

  vnet_name          = var.vnet_name
  vnet_rg_name       = var.vnet_rg_name
  location           = var.location
  tags               = var.tags
  dns_servers        = var.dns_servers
  vpn_gw_sku         = var.vpn_gw_sku
  vpn_gw_ip_name     = var.vpn_gw_ip_name
  firewall_name      = var.firewall_name
  firewall_ip_name   = var.firewall_ip_name
  bastion_ip_name    = var.bastion_ip_name
  route_table_name   = var.route_table_name
  azure_ip_space     = var.azure_ip_space
  vnet_ip_space      = var.vnet_ip_space
  workload_ip_subnet = var.workload_ip_subnet
  bastion_ip_subnet  = var.bastion_ip_subnet
  gateway_ip_subnet  = var.gateway_ip_subnet
  firewall_ip_subnet = var.firewall_ip_subnet
}