variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "location" {
  description = "Location of the resources"
  type        = string
}

variable "rg_name" {
  description = "Name of the resource group"
  type        = string
  default     = "${var.name_prefix}-rg"
}

variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
  default = {
    "Creator" = "raghav_jaiswal@epam.com"
  }
}

/*variable "tenant_id" {
  description = "Tenant ID for the Azure subscription"
  type        = string
}

variable "object_id" {
  description = "Object ID for the Azure subscription"
  type        = string
}*/

variable "sku_name_keyvault" {
  description = "SKU name for the Key Vault"
  type        = string
}

variable "redis_capacity" {
  description = "Redis cache capacity"
  type        = number
}

variable "redis_family" {
  description = "Redis cache family"
  type        = string
}

variable "git_pat" {
  description = "GitHub Personal Access Token"
  type        = string
}

variable "github_context_path" {
  description = "GitHub context path for the ACR task"
  type        = string
}

variable "image_tag" {
  description = "Tag for the Docker image"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the AKS cluster"
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

variable "sku_name_redis" {
  description = "SKU name for the Redis cache"
  type        = string
}

variable "sku_name_acr" {
  description = "SKU name for the Azure Container Registry"
  type        = string
}