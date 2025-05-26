output "aci_fqdn" {
  description = "FQDN of the Azure Container Instance"
  value       = azurerm_container_group.aci.fqdn
}