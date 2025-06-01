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
  default     = "cmtr-wp09pu9z-mod8-rg"
}

variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
  default = {
    "Creator" = "raghav_jaiswal@epam.com"
  }
}

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

variable "sku_name_redis" {
  description = "SKU name for the Redis cache"
  type        = string
}

variable "sku_name_acr" {
  description = "SKU name for the Azure Container Registry"
  type        = string
}

variable "aci_container_environment_variables" {
  description = "A map of environment variables to set in the ACI container"
  type        = map(string)
}

variable "docker_image_name" {
  description = "Name of the Docker image to be used in ACI"
  type        = string
}