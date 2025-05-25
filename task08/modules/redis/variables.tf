variable "tags" {
  description = "Tags to be applied to the resources"
  type        = map(string)
}

variable "redis_name" {
  description = "Name of the Redis Cache"
  type        = string
}

variable "location" {
  description = "Location of the Redis Cache"
  type        = string
}

variable "rg_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "redis_capacity" {
  description = "Capacity of the Redis Cache"
  type        = number
}

variable "redis_family" {
  description = "Family of the Redis Cache"
  type        = string
}

variable "sku_name" {
  description = "SKU name of the Redis Cache"
  type        = string
}

variable "key_vault_id" {
  description = "Key Vault ID for storing secrets"
  type        = string
}

