provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "resource_group" {
  name     = local.rg_name
  location = var.location
  tags     = local.common_tags
}

module "keyvault" {
  source = "./modules/keyvault"

  key_vault_name = local.keyvault_name
  rg_name        = local.rg_name
  location       = var.location
  sku_name       = var.sku_name_keyvault
  tags           = local.common_tags
  depends_on     = [azurerm_resource_group.resource_group]
}

module "redis" {
  source = "./modules/redis"

  redis_name     = local.redis_name
  location       = var.location
  rg_name        = local.rg_name
  redis_capacity = var.redis_capacity
  redis_family   = var.redis_family
  sku_name       = var.sku_name_redis
  key_vault_id   = module.keyvault.keyvault_id
  tags           = local.common_tags
  depends_on     = [azurerm_resource_group.resource_group]
}

module "acr" {
  source = "./modules/acr"

  acr_name            = local.acr_name
  location            = var.location
  rg_name             = local.rg_name
  sku                 = var.sku_name_acr
  tags                = local.common_tags
  github_context_path = var.github_context_path
  git_pat             = var.git_pat
  image_name          = local.app_image_name
  image_tag           = var.image_tag
  depends_on          = [azurerm_resource_group.resource_group]
}

module "aci" {
  source = "./modules/aci"

  aci_name           = local.aci_name
  location           = var.location
  rg_name            = local.rg_name
  image_name         = local.app_image_name
  image_tag          = var.image_tag
  redis_hostname     = module.redis.redis_hostname
  redis_primary_key  = module.redis.redis_primary_key
  acr_login_server   = module.acr.acr_login_server
  acr_admin_username = module.acr.acr_admin_username
  acr_admin_password = module.acr.acr_admin_password
  container_name     = local.container_name
  dns_name_label     = local.dns_name_label
  tags               = local.common_tags
  depends_on         = [azurerm_resource_group.resource_group]
}

module "aks" {
  source = "./modules/aks"

  aks_name       = local.aks_name
  location       = var.location
  rg_name        = local.rg_name
  tags           = local.common_tags
  dns_prefix     = local.dns_prefix
  node_pool_name = local.aks_node_pool_name
  node_count     = var.node_count
  vm_size        = var.vm_size
  os_disk_type   = var.os_disk_type
  acr_id         = module.acr.acr_id
  key_vault_id   = module.keyvault.keyvault_id
  depends_on     = [azurerm_resource_group.resource_group]
}

provider "kubectl" {
  host                   = yamldecode(module.aks.kube_config).clusters[0].cluster.server
  client_certificate     = base64decode(yamldecode(module.aks.kube_config).users[0].user.client-certificate-data)
  client_key             = base64decode(yamldecode(module.aks.kube_config).users[0].user.client-key-data)
  cluster_ca_certificate = base64decode(yamldecode(module.aks.kube_config).clusters[0].cluster.certificate-authority-data)
  load_config_file       = false
}


provider "kubernetes" {
  host                   = yamldecode(module.aks.kube_config).clusters[0].cluster.server
  client_certificate     = base64decode(yamldecode(module.aks.kube_config).users[0].user.client-certificate-data)
  client_key             = base64decode(yamldecode(module.aks.kube_config).users[0].user.client-key-data)
  cluster_ca_certificate = base64decode(yamldecode(module.aks.kube_config).clusters[0].cluster.certificate-authority-data)
}

resource "kubectl_manifest" "deployment" {
  yaml_body = templatefile("${path.module}/k8s-manifests/deployment.yaml.tftpl", {
    acr_login_server = "${local.acr_name}.azurecr.io"
    app_image_name   = local.app_image_name
    image_tag        = "latest"
  })

  wait_for {
    field {
      key   = "status.availableReplicas"
      value = "1"
    }
  }
  depends_on = [module.aks]
}

resource "kubectl_manifest" "service" {
  wait_for {
    field {
      key        = "status.loadBalancer.ingress.[0].ip"
      value      = "^(\\d+(\\.|$)){4}"
      value_type = "regex"
    }
  }

  yaml_body = file("${path.module}/k8s-manifests/service.yaml")

  depends_on = [module.aks, kubectl_manifest.deployment]
}

resource "kubectl_manifest" "secret_provider" {
  yaml_body = templatefile("${path.module}/k8s-manifests/secret-provider.yaml.tftpl", {
    aks_kv_access_identity_id  = module.aks.aks_kv_access_identity_id
    kv_name                    = local.keyvault_name
    redis_url_secret_name      = local.redis_hostname_secret_name
    redis_password_secret_name = local.redis_primary_key_secret_name
    tenant_id                  = azurerm_user_assigned_identity.identity.tenant_id
  })

  depends_on = [module.aks, kubectl_manifest.deployment, module.redis, module.keyvault]
}

data "kubernetes_service" "k8_service" {
  metadata {
    name = "redis-flask-app-service"
  }
  depends_on = [kubectl_manifest.service]
}

resource "azurerm_user_assigned_identity" "identity" {
  location            = var.location # Place identity in same region as AKS cluster
  name                = "identity"   # Friendly name for tracking in Azure portal
  resource_group_name = var.rg_name  # Identity lives in the same RG as AKS
  depends_on          = [azurerm_resource_group.resource_group]
}