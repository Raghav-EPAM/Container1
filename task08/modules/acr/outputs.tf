output "acr_admin_username" {
  value       = azurerm_container_registry.acr.admin_username
  description = "Admin username for the Azure Container Registry"
}

output "acr_admin_password" {
  value       = azurerm_container_registry.acr.admin_password
  description = "Admin password for the Azure Container Registry"
}

output "acr_login_server" {
  value       = azurerm_container_registry.acr.login_server
  description = "Login server for the Azure Container Registry"
}

output "acr_id" {
  value       = azurerm_container_registry.acr.id
  description = "Resource ID of the Azure Container Registry"
}