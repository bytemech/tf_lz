resource "azurerm_resource_group" "vnet_rg" {
  name     = var.rg_name
  location = var.location
  tags = var.tags
}
