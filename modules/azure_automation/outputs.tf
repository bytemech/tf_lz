output "automation_account_id" {
  description = "The ID of the Automation Account that is created."
  value       = azurerm_automation_account.main.id
}

output "automation_account_dsc_server_endpoint" {
  description = "The DSC Server Endpoint of the Automation Account that is created."
  value       = azurerm_automation_account.main.dsc_server_endpoint
}

output "automation_account_dsc_access_key" {
  description = "The access key for the DSC Server Endpoint of the Automation Account that is created."
  value       = azurerm_automation_account.main.dsc_primary_access_key
}

