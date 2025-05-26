output "redis_id" {
  description = "ID of the Redis Cache"
  value       = azurerm_redis_cache.redis.id
}

output "redis_hostname" {
  description = "Hostname of the Redis Cache"
  value       = azurerm_redis_cache.redis.hostname
}

output "redis_primary_key" {
  description = "Primary access key for the Redis Cache"
  value       = azurerm_redis_cache.redis.primary_access_key
  sensitive   = true
}