variable "key_vault_name" {
  description = "The name of the Key Vault"
  type        = string
}

variable "location" {
  description = "The Azure region where the Key Vault will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the Key Vault will be created"
  type        = string
}

variable "tags" {
  description = "Tags to assign to the Key Vault"
  type        = map(string)
}

variable "sku_name" {
  description = "The SKU name of the Key Vault"
  type        = string
}