provider "azurerm" {
    version = "=1.44.0" #See https://github.com/terraform-providers/terraform-provider-azurerm
    features {} 
}

provider "azurerm" {
    version = "=1.44.0" #See https://github.com/terraform-providers/terraform-provider-azurerm
    alias = "hub"
    features {} 
}