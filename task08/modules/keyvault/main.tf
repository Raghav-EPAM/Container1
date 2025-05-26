resource "azurerm_key_vault" "keyvault" {
  name                     = var.key_vault_name
  location                 = var.location
  resource_group_name      = var.rg_name
  tenant_id                = azurerm_user_assigned_identity.keyvault_identity.tenant_id
  sku_name                 = var.sku_name
  purge_protection_enabled = false
  tags                     = var.tags
}

resource "azurerm_user_assigned_identity" "keyvault_identity" {
  location            = var.location        # Place identity in same region as AKS cluster
  name                = "keyvault-identity" # Friendly name for tracking in Azure portal
  resource_group_name = var.rg_name         # Identity lives in the same RG as AKS
}

resource "azurerm_key_vault_access_policy" "keyvault_policy" {
  key_vault_id = azurerm_key_vault.keyvault.id
  /*tenant_id    = var.tenant_id
  object_id    = var.object_id*/
  tenant_id = azurerm_user_assigned_identity.keyvault_identity.tenant_id
  object_id = azurerm_user_assigned_identity.keyvault_identity.principal_id

  secret_permissions = [
    "Get",
    "List",
    "Set",
    "Delete",
    "Purge"
  ]
}