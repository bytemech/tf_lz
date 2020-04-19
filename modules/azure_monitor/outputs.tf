output "monitor_workspace_id" {
  description = "The Log Analytics Workspace Resource ID"
  value       = azurerm_log_analytics_workspace.monitor.id
}

output "monitor_workspace_key" {
  description = "The Log Analytics Workspace Primary Key"
  value       = azurerm_log_analytics_workspace.monitor.primary_shared_key
}