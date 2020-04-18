module "spoke" {
  source    = "./subscriptions/core"
  providers = {
    azurerm.default = azurerm.spoke
  }
}