data "azurerm_client_config" "current" {}


resource "azurerm_resource_group" "resource_group" {
  name     = local.rg_name
  location = var.location
  tags     = local.common_tags
}

module "keyvault" {
  source = "./modules/keyvault"

  key_vault_name      = local.keyvault_name
  resource_group_name = local.rg_name
  location            = var.location
  sku_name            = var.sku_name_keyvault
  tags                = local.common_tags
}

module "redis" {
  source = "./modules/redis"

  redis_name     = local.redis_name
  location       = var.location
  rg_name        = local.rg_name
  redis_capacity = var.redis_capacity
  redis_family   = var.redis_family
  sku_name       = var.sku_name_redis
  key_vault_id   = module.keyvault.key_vault_id
  tags           = local.common_tags
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
}

module "aci" {
  source = "./modules/aci"

  instance_name      = local.instance_name
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
}

module "aks" {
  source = "./modules/aks"

  aks_name                   = local.aks_name
  location                   = var.location
  rg_name                    = local.rg_name
  tags                       = local.common_tags
  dns_prefix                 = local.dns_prefix
  node_pool_name             = local.aks_name
  node_count                 = var.node_count
  vm_size                    = var.vm_size
  os_disk_type               = var.os_disk_type
  user_assigned_identity_id  = module.keyvault.user_assigned_identity_id
  kubelet_identity_object_id = module.keyvault.kubelet_identity_object_id
  acr_id                     = module.acr.acr_id
  key_vault_id               = module.keyvault.key_vault_id
}