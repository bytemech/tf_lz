provider "azurerm" {
  #<Please edit
  subscription_id = "fc1d3a4d-16b5-4232-b28b-963e7844911b"
  #>

  #<Please edit if you have copied this file
  alias = "spoke1"
  #>

  #<Please do not edit
  version = "=1.44.0" #See https://github.com/terraform-providers/terraform-provider-azurerm/issues/6516
  #features {} 
  #> 
}

#<Please edit if you have copied this file (i.e. replace spoke1 with spoke2)
module "spoke1" {
  providers = {
    azurerm.default = azurerm.spoke1
    #>
    #<Please do not edit
    azurerm.hub = azurerm.hub
  }
  #>

  #<Please edit
  vnet_name          = "spoke_vnet${random_id.spoke.b64_url}"
  rg_name            = "spoke_vnet${random_id.spoke.b64_url}"
  bastion_ip_name    = "bastion_ip${random_id.spoke.b64_url}"
  route_table_name   = "spoke_vnet${random_id.spoke.b64_url}"
  vnet_ip_space      = ["10.3.0.0/22"]
  workload_ip_subnet = "10.3.0.0/24"
  bastion_ip_subnet  = "10.3.3.160/27"
  tags = {
    environment = "spoke"
  }
  #>

  #<Please do not edit
  source              = "./subscriptions/spoke"
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
#>