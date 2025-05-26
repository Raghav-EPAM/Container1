output "aci_fqdn" {
  description = "FQDN of the Azure Container Instance"
  value       = module.aci.aci_fqdn
}

output "aci_ip_address" {
  value = module.aci.aci_ip_address
}

output "aks_lb_ip" {
  value = data.kubernetes_service.k8_service.status[0].load_balancer[0].ingress[0].ip
}