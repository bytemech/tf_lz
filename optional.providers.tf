provider "azurerm" {
  version         = "=1.44.0" #See https://github.com/terraform-providers/terraform-provider-azurerm/issues/6516
  alias           = "spoke"
  subscription_id = "fc1d3a4d-16b5-4232-b28b-963e7844911b"
  #features {}  
}