module "hub" {
  source    = "./subscriptions/hub"
  providers = {
    azurerm.default = azurerm.hub
  }
}

module "core" {
  source    = "./subscriptions/core"
  providers = {
    azurerm.default = azurerm.core
  }
}

module "spoke" {
  source    = "./subscriptions/core"
  providers = {
    azurerm.default = azurerm.spoke
  }
}