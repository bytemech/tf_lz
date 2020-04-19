resource "azurerm_key_vault_secret" "breakglass" {
  provider     = azurerm.default
  name         = "${var.vm_name}-breakglass"
  value        = random_string.breakglass.result
  key_vault_id = var.key_vault_id
}

resource "random_string" "breakglass" {
  length = 16

  keepers = {
    vm_name = "${var.vm_name}"
  }
}
