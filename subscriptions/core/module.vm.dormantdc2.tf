module "dormantdc2" {
  source = "../../modules/windows_vm"

  providers = {
    azurerm.default = azurerm.default
  }

  rg_name             = var.rg_name
  location            = var.location
  tags                = var.tags
  vm_name             = var.dormantdc2_name
  vm_size             = var.dormantdc_vm_size
  ip_addr             = var.dormantdc2_ip_addr
  subnet_id           = module.spoke_network.workload_subnet_id
  automation_account_dsc_server_endpoint = module.azure_automation.automation_account_dsc_server_endpoint
  automation_account_dsc_access_key = module.azure_automation.automation_account_dsc_access_key
  automation_account_dsc_node_name = "DormantDC.localhost"
}