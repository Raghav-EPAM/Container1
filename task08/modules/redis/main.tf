resource "azurerm_redis_cache" "redis" {
  name                = var.redis_name
  location            = var.location
  resource_group_name = var.rg_name
  capacity            = var.redis_capacity
  family              = var.redis_family
  sku_name            = var.sku_name

  redis_configuration {
    maxmemory_policy = "allkeys-lru"
  }
  tags = var.tags
}

resource "azurerm_key_vault_secret" "redis_hostname" {
  name         = "redis-hostname"
  value        = azurerm_redis_cache.redis.hostname
  key_vault_id = var.key_vault_id
  depends_on   = [azurerm_redis_cache.redis]
}

resource "azurerm_key_vault_secret" "redis_primary_key" {
  name         = "redis-primary-key"
  value        = azurerm_redis_cache.redis.primary_access_key
  key_vault_id = var.key_vault_id
  depends_on   = [azurerm_redis_cache.redis]
}