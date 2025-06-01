output "aci_fqdn" {
  description = "FQDN of the Azure Container Instance"
  value       = azurerm_container_group.container_group.fqdn
}

output "aci_ip_address" {
  value       = azurerm_container_group.container_group.ip_address
  description = "IP address of the Azure Container Instance"
}