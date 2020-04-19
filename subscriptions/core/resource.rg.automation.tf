resource "azurerm_resource_group" "automation" {
  provider = azurerm.default
  name     = var.automation_rg_name
  location = var.location
}

resource "azurerm_resource_group" "monitor" {
  provider = azurerm.default
  name     = var.monitor_rg_name
  location = var.location
}