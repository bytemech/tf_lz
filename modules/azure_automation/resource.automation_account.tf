resource "azurerm_automation_account" "main" {
  provider            = azurerm.default
  name                = var.automation_account_name
  location            = var.location
  resource_group_name = var.rg_name

  sku_name = "Basic"

  provisioner "local-exec" {
    command     = ".'${path.module}\\helpers\\import-aa-dsc-modules.ps1' -automationaccountname ${var.automation_account_name} -subscriptionid ${data.azurerm_subscription.current.subscription_id} -resourcegroupname ${var.rg_name} "
    interpreter = ["PowerShell", "-Command"]
  }
}