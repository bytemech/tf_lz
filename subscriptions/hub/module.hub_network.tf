module "hub_network" {
    source = "../../modules/hub_network"

    vnet_name = var.vnet_name
    rg_name = var.rg_name
    location = var.location
    tags = var.tags
    dns_servers = var.dns_servers
    vpn_gw_sku = var.vpn_gw_sku
    vpn_gw_ip_name = var.vpn_gw_ip_name
    firewall_name = var.firewall_name
    firewall_ip_name = var.firewall_ip_name
    bastion_ip_name = var.bastion_ip_name
    route_table_name = var.route_table_name
}