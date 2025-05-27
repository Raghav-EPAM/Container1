variable "tags" {
  description = "Tags to be applied to the resources"
  type        = map(string)
}

variable "location" {
  description = "Location of the AKS cluster"
  type        = string
}

variable "rg_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "aks_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  type        = string
}

variable "node_pool_name" {
  description = "Name of the AKS node pool"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the AKS node pool"
  type        = number
}

variable "acr_id" {
  description = "ID of the Azure Container Registry"
  type        = string
}

variable "key_vault_id" {
  description = "Key Vault ID for storing secrets"
  type        = string
}