provider "azurerm" {
  version = "=1.44.0" #See https://github.com/terraform-providers/terraform-provider-azurerm/issues/6516
  alias   = "default"
  #features {}  
}

provider "azurerm" {
  version = "=1.44.0" #See https://github.com/terraform-providers/terraform-provider-azurerm/issues/6516
  alias   = "hub"
  #features {}  
}