resource "azurerm_virtual_machine_extension" "dsc" {
  provider             = azurerm.default
  name                 = "DevOpsDSC"
  location             = var.location
  resource_group_name  = var.rg_name
  virtual_machine_name = var.vm_name
  publisher            = "Microsoft.Powershell"
  type                 = "DSC"
  type_handler_version = "2.73"
  depends_on           = ["azurerm_virtual_machine.virtual_machine"]

  settings = <<SETTINGS
        {
            "WmfVersion": "latest",
            "ModulesUrl": "https://eus2oaasibizamarketprod1.blob.core.windows.net/automationdscpreview/RegistrationMetaConfigV2.zip",
            "ConfigurationFunction": "RegistrationMetaConfigV2.ps1\\RegistrationMetaConfigV2",
            "Privacy": {
                "DataCollection": ""
            },
            "Properties": {
                "RegistrationKey": {
                  "UserName": "PLACEHOLDER_DONOTUSE",
                  "Password": "PrivateSettingsRef:registrationKeyPrivate"
                },
                "RegistrationUrl": "${var.automation_account_dsc_server_endpoint}",
                "NodeConfigurationName": "${var.automation_account_dsc_node_name}",
                "ConfigurationMode": "ApplyAndMonitor",
                "ConfigurationModeFrequencyMins": 15,
                "RefreshFrequencyMins": 30,
                "RebootNodeIfNeeded": false,
                "ActionAfterReboot": "continueConfiguration",
                "AllowModuleOverwrite": false
            }
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