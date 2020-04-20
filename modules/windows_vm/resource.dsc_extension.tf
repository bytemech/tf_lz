resource "azurerm_virtual_machine_extension" "dsc" {
  provider             = azurerm.default
  name                 = "DevOpsDSC"
  virtual_machine_id   = azurerm_virtual_machine.main.id
  publisher            = "Microsoft.Powershell"
  type                 = "DSC"
  type_handler_version = "2.77"
  depends_on           = [azurerm_virtual_machine.main]

  settings = <<SETTINGS
        {
          "Properties": [
              {
                "Name": "RegistrationKey",
                "Value": {
                  "UserName": "PLACEHOLDER_DONOTUSE",
                  "Password": "PrivateSettingsRef:registrationKeyPrivate"
                },
                "TypeName": "System.Management.Automation.PSCredential"
              },
              {
                "Name": "RegistrationUrl",
                "Value": "${var.automation_account_dsc_server_endpoint}",
                "TypeName": "System.String"
              },
              {
                "Name": "NodeConfigurationName",
                "Value": "${var.automation_account_dsc_node_name}",
                "TypeName": "System.String"
              }
            ]
        }
    SETTINGS

  protected_settings = <<PROTECTED_SETTINGS
    {
      "Items": {
        "registrationKeyPrivate" : "${var.automation_account_dsc_access_key}"
      }
    }
PROTECTED_SETTINGS
}
