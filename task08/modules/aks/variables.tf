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

variable "vm_size" {
  description = "VM size for the AKS nodes"
  type        = string
}

variable "os_disk_type" {
  description = "OS disk type for the AKS nodes"
  type        = string
}

/*variable "user_assigned_identity_id" {
  description = "User Assigned Identity ID for the AKS cluster"
  type        = string
}

variable "kubelet_identity_object_id" {
  description = "Object ID of the AKS cluster's kubelet identity"
  type        = string
}*/

variable "acr_id" {
  description = "ID of the Azure Container Registry"
  type        = string
}

variable "key_vault_id" {
  description = "Key Vault ID for storing secrets"
  type        = string
}

variable "tenant_id" {
  description = "Tenant ID for the Azure subscription"
  type        = string
}

variable "object_id" {
  description = "Object ID for the Azure subscription"
  type        = string
}