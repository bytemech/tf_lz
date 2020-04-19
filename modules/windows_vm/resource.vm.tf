resource "azurerm_virtual_machine" "main" {
  provider            = azurerm.default
  name                = var.vm_name
  resource_group_name = var.rg_name
  location            = var.location
  vm_size             = var.vm_size
  tags                = var.tags

  network_interface_ids = [
    azurerm_network_interface.main.id,
  ]
  os_profile {
    computer_name  = "var.vm_name"
    admin_username = "breakglass"
    admin_password = random_string.breakglass.result
  }

  os_profile_windows_config {
    provision_vm_agent        = true
    enable_automatic_upgrades = true
  }

  storage_os_disk {
    name              = "${var.vm_name}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
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
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "120"
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "data" {
  provider           = azurerm.default
  managed_disk_id    = azurerm_managed_disk.data.id
  virtual_machine_id = azurerm_virtual_machine.main.id
  lun                = "10"
  caching            = "None"
}