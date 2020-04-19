resource "azurerm_log_analytics_workspace" "monitor" {
  provider            = azurerm.default
  name                = var.monitor_workspace_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "PerGB2018"
  retention_in_days   = var.monitor_workspace_retention_days
}

resource "azurerm_log_analytics_linked_service" "automation" {
  provider            = azurerm.default
  resource_group_name = var.rg_name
  workspace_name      = azurerm_log_analytics_workspace.monitor.name
  resource_id         = var.automation_account_id
}