resource "azurerm_resource_group" "automation" {
  name     = var.automation_rg_name
  location = var.location
}