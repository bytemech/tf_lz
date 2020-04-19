resource "azurerm_resource_group" "workload" {
  provider = azurerm.default
  name     = var.workload_rg_name
  location = var.location
  tags     = var.tags
}