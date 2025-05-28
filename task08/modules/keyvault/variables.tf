variable "key_vault_name" {
  description = "The name of the Key Vault"
  type        = string
}

variable "location" {
  description = "The Azure region where the Key Vault will be created"
  type        = string
}

variable "rg_name" {
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

variable "tenant_id" {
  description = "The tenant ID for the Key Vault access policy"
  type        = string
}

variable "object_id" {
  description = "The object ID for the Key Vault access policy"
  type        = string
}