terraform {
    required_version = ">0.12.0"
}

provider "azurerm" {
    alias = "default"
}

provider "azurerm" {
    alias = "hub"
}