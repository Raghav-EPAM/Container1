data "azurerm_client_config" "current" {}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = var.dns_prefix
  tags                = var.tags

  default_node_pool {
    name         = var.node_pool_name
    node_count   = var.node_count
    vm_size      = var.vm_size
    os_disk_type = var.os_disk_type
  }

  identity {
    type = "UserAssigned"
  }

  key_vault_secrets_provider {
    secret_rotation_enabled  = true
    secret_rotation_interval = "2m"
  }
  role_based_access_control_enabled = true
}

data "azurerm_subscription" "primary" {

}

resource "azurerm_role_assignment" "aks_pull_acr" {
  principal_id         = data.azurerm_client_config.current.object_id
  role_definition_name = "AcrPull"
  scope                = data.azurerm_subscription.primary.id
}

resource "azurerm_key_vault_access_policy" "aks_kv_policy" {
  key_vault_id = var.key_vault_id
  tenant_id    = var.tenant_id
  object_id    = var.object_id

  secret_permissions = [
    "Get",
    "List"
  ]
}