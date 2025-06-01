resource "azurerm_container_group" "container_group" {
  name                = var.aci_name
  resource_group_name = var.rg_name
  location            = var.location
  os_type             = "Linux"
  ip_address_type     = "Public"
  dns_name_label      = var.aci_name

  image_registry_credential {
    server   = var.acr_login_server
    username = var.acr_admin_username
    password = var.acr_admin_password
  }

  container {
    name   = var.container_name
    image  = var.image_name
    cpu    = "1"
    memory = "1.5"

    cpu_limit    = "1"
    memory_limit = "1.5"

    ports {
      port     = 8080
      protocol = "TCP"
    }
    environment_variables        = var.container_environment_variables
    secure_environment_variables = var.container_secure_environment_variables
  }

  tags = var.tags
}