variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
}

variable "aci_name" {
  description = "The name of the container instance"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy the container instance"
  type        = string
}

variable "rg_name" {
  description = "The name of the resource group"
  type        = string
}

variable "container_name" {
  description = "The name of the container"
  type        = string
}

variable "image_name" {
  description = "The Docker image name to use for the container"
  type        = string
}

variable "acr_login_server" {
  description = "The login server of the Azure Container Registry"
  type        = string
}

variable "acr_admin_username" {
  description = "The admin username for the Azure Container Registry"
  type        = string
}

variable "acr_admin_password" {
  description = "The admin password for the Azure Container Registry"
  type        = string
}

variable "redis_hostname" {
  description = "The hostname of the Redis instance"
  type        = string
}

variable "redis_primary_key" {
  description = "The primary key for the Redis instance"
  type        = string
}

variable "container_environment_variables" {
  description = "A map of environment variables to set in the container"
  type        = map(string)
}

variable "container_secure_environment_variables" {
  description = "A map of secure environment variables to set in the container"
  type        = map(string)
}