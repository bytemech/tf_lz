resource "azurerm_automation_account" "main" {
  name                = var.automation_account_name
  location            = var.location
  resource_group_name = var.rg_name

  sku_name = "Basic"
}