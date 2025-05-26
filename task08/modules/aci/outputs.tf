output "aci_fqdn" {
  description = "FQDN of the Azure Container Instance"
  value       = azurerm_container_group.aci.fqdn
}

output "aci_ip_address" {
  value = azurerm_container_group.aci.ip_address
}