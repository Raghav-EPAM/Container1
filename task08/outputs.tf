output "aci_fqdn" {
  description = "FQDN of the Azure Container Instance"
  value       = module.aci.aci_fqdn
}

/*output "aks_lb_ip" {
  description = "Load Balancer IP address of APP in AKS"
  value       = kubernetes_service.aks_service.status[0].load_balancer[0].ingress[0].ip
}*/