variable "acr_name" {
  description = "Name of the Azure Container Registry"
  type        = string
}

variable "sku" {
  description = "SKU of the ACR"
  type        = string
}

variable "location" {
  description = "Azure region for the resource"
  type        = string
}

variable "rg_name" {
  description = "Name of the resource group"
  type        = string
}

variable "image_name" {
  description = "Name of the docker image"
  type        = string
}

variable "image_tag" {
  description = "Tag of the docker image"
  type        = string
  default     = "latest"
}

variable "github_context_path" {
  description = "GitHub context path for ACR task (with branch and folder)"
  type        = string
}

variable "git_pat" {
  description = "GitHub Personal Access Token"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Tags to assign to the resources"
  type        = map(string)
}