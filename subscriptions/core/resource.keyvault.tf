data "http" "localip" {
    url = "http://canihazip.com/s"
}

resource "azurerm_key_vault" "example" {
  provider = azurerm.default
  name                        = "${azurerm_resource_group.workload.name}-breakglass"
  location                    = azurerm_resource_group.workload.location
  resource_group_name         = azurerm_resource_group.workload.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_enabled         = true
  purge_protection_enabled    = false
  tags = var.tags

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "get",
    ]

    secret_permissions = [
      "get",
      "set",
      "list",
    ]

    storage_permissions = [
      "get",
    ]
  }

  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
  }
}