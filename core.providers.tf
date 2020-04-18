provider "azurerm" {
  version         = "=1.44.0" #See https://github.com/terraform-providers/terraform-provider-azurerm/issues/6516/issues/6516
  alias           = "core"
  subscription_id = "0fe526bf-4df2-46e4-a59b-ef9521fe4385"
  #features {}  
}

provider "azurerm" {
  version         = "=1.44.0" #See https://github.com/terraform-providers/terraform-provider-azurerm/issues/6516/issues/6516
  alias           = "hub"
  subscription_id = "079b558e-9348-4e85-9d69-768372b414bb"
  #features {}  
}
