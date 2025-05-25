output "kube_config" {
  description = "Kube config block"
  value       = azurerm_kubernetes_cluster.this.kube_config_raw
  sensitive   = true
}

output "host" {
  description = "AKS cluster host"
  value       = azurerm_kubernetes_cluster.this.kube_config.0.host
}

output "client_certificate" {
  description = "AKS client certificate"
  value       = azurerm_kubernetes_cluster.this.kube_config.0.client_certificate
  sensitive   = true
}

output "client_key" {
  description = "AKS client key"
  value       = azurerm_kubernetes_cluster.this.kube_config.0.client_key
  sensitive   = true
}

output "cluster_ca_certificate" {
  description = "Cluster CA certificate"
  value       = azurerm_kubernetes_cluster.this.kube_config.0.cluster_ca_certificate
  sensitive   = true
}

output "aks_managed_identity_principal_id" {
  description = "AKS user-assigned identity principal ID"
  value       = data.azurerm_user_assigned_identity.object_id.principal_id
}
