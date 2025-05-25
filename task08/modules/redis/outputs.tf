output "redis_id" {
  description = "ID of the Redis Cache"
  value       = azurerm_redis_cache.this.id
}

output "redis_hostname" {
  description = "Hostname of the Redis Cache"
  value       = azurerm_redis_cache.this.hostname
}

output "redis_primary_key" {
  description = "Primary access key for the Redis Cache"
  value       = azurerm_redis_cache.this.primary_access_key
  sensitive   = true
}