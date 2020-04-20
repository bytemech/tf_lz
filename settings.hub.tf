provider "azurerm" {

  #<Please edit
  subscription_id = "079b558e-9348-4e85-9d69-768372b414bb"
  #>

  #<Please do not edit 
  version = "=1.44.0" #See https://github.com/terraform-providers/terraform-provider-azurerm/issues/6516/issues/6516
  alias   = "hub"
  #features {}
  #<
}

module "hub" {
  #<Please edit
  vnet_name          = "hub_vnet${random_id.hub.b64_url}"
  vnet_rg_name       = "vnet_rg${random_id.hub.b64_url}"
  dns_servers        = ["1.1.1.1"]
  vpn_gw_sku         = "Standard"
  vpn_gw_ip_name     = "vpn_gw_ip${random_id.hub.b64_url}"
  firewall_name      = "firewall${random_id.hub.b64_url}"
  firewall_ip_name   = "firewall_ip${random_id.hub.b64_url}"
  bastion_ip_name    = "bastion_ip${random_id.hub.b64_url}"
  route_table_name   = "hub_vnet${random_id.hub.b64_url}"
  azure_ip_space     = "10.0.0.0/8"
  vnet_ip_space      = ["10.1.0.0/22"]
  workload_ip_subnet = "10.1.0.0/24"
  bastion_ip_subnet  = "10.1.3.192/27"
  gateway_ip_subnet  = "10.1.3.224/27"
  firewall_ip_subnet = "10.1.3.128/26"

  tags = {
    environment = "hub"
  }
  #>

  #<Please do not edit
  location = var.location
  source   = "./subscriptions/hub"
  providers = {
    azurerm.default = azurerm.hub

  }

}
resource "random_id" "hub" {
  byte_length = 4

  keepers = {
    location = var.location
  }
}
#>