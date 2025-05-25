output "keyvault_id" {
  description = "ID of the Key Vault"
  value       = azurerm_key_vault.this.id
}

output "keyvault_name" {
  description = "Name of the Key Vault"
  value       = azurerm_key_vault.this.name
}