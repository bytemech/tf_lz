output "automation_account_dsc_server_endpoint" {
  description = "The DSC Server Endpoint of the Automation Account that is created."
  value       = module.azure_automation.automation_account_dsc_server_endpoint
}

output "automation_account_dsc_access_key" {
  description = "The access key for the DSC Server Endpoint of the Automation Account that is created."
  value       = module.azure_automation.automation_account_dsc_access_key
}