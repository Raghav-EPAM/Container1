resource "azurerm_user_assigned_identity" "k8s_identity" {
  location            = var.location   # Place identity in same region as AKS cluster
  name                = "k8s-identity" # Friendly name for tracking in Azure portal
  resource_group_name = var.rg_name    # Identity lives in the same RG as AKS
}

resource "azurerm_role_assignment" "aks_pull_acr" {
  principal_id         = azurerm_user_assigned_identity.k8s_identity.principal_id
  role_definition_name = "AcrPull"
  scope                = var.acr_id
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = var.dns_prefix
  tags                = var.tags

  default_node_pool {
    name         = var.node_pool_name
    node_count   = var.node_count
    vm_size      = "Standard_D2ads_v5"
    os_disk_type = "Ephemeral"
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.k8s_identity.id]
  }

  key_vault_secrets_provider {
    secret_rotation_enabled  = true
    secret_rotation_interval = "2m"
  }
  role_based_access_control_enabled = true
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault_access_policy" "aks_kv_policy" {
  key_vault_id = var.key_vault_id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_user_assigned_identity.k8s_identity.principal_id

  secret_permissions = [
    "Get",
    "List",
    "Set",
    "Delete",
    "Purge"
  ]
}