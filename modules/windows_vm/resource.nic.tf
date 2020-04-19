resource "azurerm_network_interface" "main" {
  name                = "${var.vmname}-nic0"
  location            = var.location
  resource_group_name = var.rg_name
  tags = var.tags
  
  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Static"
    private_ip_address = var.ip_addr
    primary = true
  }
}
