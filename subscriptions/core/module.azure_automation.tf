module "azure_automation" {
  source = "../../modules/azure_automation"
  providers = {
    azurerm.default = azurerm.default
  }

  rg_name                 = azurerm_resource_group.automation.name
  location                = var.location
  automation_account_name = var.automation_account_name
  tags                    = var.tags
}

