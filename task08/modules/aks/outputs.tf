output "kube_config" {
  description = "Kube config block"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
}

output "aks_kv_access_identity_id" {
  value = azurerm_user_assigned_identity.ua_identity1.id
}