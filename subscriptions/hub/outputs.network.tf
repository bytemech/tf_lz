output "hub_vnet_name" {
  description = "The name of the Hub vNet that is created."
  value       = module.hub_network.hub_vnet_name
}

output "hub_vnet_rg" {
  description = "The name of resource group the Hub vNet that is created in."
  value       = module.hub_network.hub_vnet_rg
}

output "hub_vnet_id" {
  description = "The ID of the Hub vNet that is created."
  value       = module.hub_network.hub_vnet_id
}

output "firewall_private_ip" {
  description = "The Private IP of the Azure Firewall that is created."
  value       = module.hub_network.firewall_private_ip
}

output "dns_servers" {
  value = var.dns_servers
}