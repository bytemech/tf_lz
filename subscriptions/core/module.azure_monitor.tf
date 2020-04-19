module "azure_monitor" {
  source = "../../modules/azure_monitor"
  providers = {
    azurerm.default = azurerm.default
  }

  rg_name                          = azurerm_resource_group.monitor.name
  location                         = var.location
  monitor_workspace_name           = var.monitor_workspace_name
  monitor_workspace_retention_days = var.monitor_workspace_retention_days
  automation_account_id            = module.azure_automation.automation_account_id
  tags                             = var.tags
}