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
    azurerm.hub     = azurerm.hub
  }

  vnet_name          = "core_vnet${random_id.core.dec}"
  rg_name            = "core_vnet${random_id.core.dec}"
  location           = var.location
  bastion_ip_name    = "bastion_ip${random_id.core.dec}"
  route_table_name   = "core_vnet${random_id.core.dec}"
  vnet_ip_space      = ["10.2.0.0/22"]
  workload_ip_subnet = "10.2.0.0/24"
  bastion_ip_subnet  = "10.2.3.160/27"
  
  automation_rg_name = "automation${random_id.core.dec}"
  automation_account_name = "automation-account-${random_id.core.dec}"
  monitor_rg_name = "monitor${random_id.core.dec}"
  monitor_workspace_name = "workspace${random_id.core.dec}"
  monitor_workspace_retention_days = 30
  workload_rg_name = "workload${random_id.core.dec}"
  dormantdc_vm_size = "Standard_Dv2"
  dormantdc1_name = "dc1${random_id.core.dec}"
  dormantdc2_name = "dc2${random_id.core.dec}"
  dormantdc1_ip_addr = "10.2.0.10"
  dormantdc2_ip_addr = "10.2.0.11"

  tags = {
    environment = "core"
  }

  dns_servers         = module.hub.dns_servers
  firewall_ip_address = module.hub.firewall_private_ip
  hub_vnet_name       = module.hub.hub_vnet_name
  hub_vnet_rg         = module.hub.hub_vnet_rg
  hub_vnet_id         = module.hub.hub_vnet_id
}

resource "random_id" "core" {
  byte_length = 4

  keepers = {
    location = var.location
  }
}
