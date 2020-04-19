resource "azurerm_windows_virtual_machine" "main" {
  provider            = azurerm.default
  name                = var.vm_name
  resource_group_name = var.rg_name
  location            = var.location
  size                = var.vm_size
  admin_username      = "breakglass"
  admin_password      = random_string.breakglass.result
  tags                = var.tags

  network_interface_ids = [
    azurerm_network_interface.main.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}

resource "azurerm_managed_disk" "data" {
  provider             = azurerm.default
  name                 = "${var.vm_name}-data0"
  location             = var.location
  resource_group_name  = var.rg_name
  storage_account_type = "StandardSSD_LRS"
  create_option        = "Empty"
  disk_size_gb         = "120"
  tags                 = var.tags
}

