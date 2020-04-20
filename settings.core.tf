provider "azurerm" {
  #<Please edit
  subscription_id = "0fe526bf-4df2-46e4-a59b-ef9521fe4385"
  #>

  #<Please do not edit
  version = "=1.44.0" #See https://github.com/terraform-providers/terraform-provider-azurerm/issues/6516/issues/6516
  alias   = "core"
  #features {}  
}


module "core" {
  #<Please edit
  vnet_name    = "core_vnet${random_id.core.b64_url}"
  vnet_rg_name = "core_vnet${random_id.core.b64_url}"

  bastion_ip_name    = "bastion_ip${random_id.core.b64_url}"
  route_table_name   = "core_vnet${random_id.core.b64_url}"
  vnet_ip_space      = ["10.2.0.0/22"]
  workload_ip_subnet = "10.2.0.0/24"
  bastion_ip_subnet  = "10.2.3.160/27"

  automation_rg_name               = "automation${random_id.core.b64_url}"
  automation_account_name          = "automation-account-${random_id.core.b64_url}"
  monitor_rg_name                  = "monitor${random_id.core.b64_url}"
  monitor_workspace_name           = "workspace${random_id.core.b64_url}"
  monitor_workspace_retention_days = 30
  workload_rg_name                 = "workload${random_id.core.b64_url}"
  dormantdc_vm_size                = "Standard_D3_v2"
  dormantdc1_name                  = "dc1${random_id.core.b64_url}"
  dormantdc2_name                  = "dc2${random_id.core.b64_url}"
  dormantdc1_ip_addr               = "10.2.0.10"
  dormantdc2_ip_addr               = "10.2.0.11"

  tags = {
    environment = "core"
  }
  #>

  #<Please do not edit
  source = "./subscriptions/core"
  providers = {
    azurerm.default = azurerm.core
    azurerm.hub     = azurerm.hub
  }
  location            = var.location
  dns_servers         = module.hub.dns_servers
  firewall_ip_address = module.hub.firewall_private_ip
  hub_vnet_name       = module.hub.hub_vnet_name
  hub_vnet_rg         = module.hub.hub_vnet_rg
  hub_vnet_id         = module.hub.hub_vnet_id
}
resource "random_id" "core" {
  byte_length = 2

  keepers = {
    location = var.location
  }
}
#>