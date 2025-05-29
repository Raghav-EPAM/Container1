resource "azurerm_container_group" "aci" {
  name                = var.aci_name
  location            = var.location
  resource_group_name = var.rg_name
  os_type             = "Linux"
  ip_address_type     = "Public"
  dns_name_label      = var.dns_name_label
  tags                = var.tags



  image_registry_credential {
    server   = var.acr_login_server
    username = var.acr_admin_username
    password = var.acr_admin_password
  }

  container {
    name   = var.container_name
    image  = "${var.acr_login_server}/${var.image_name}"
    cpu    = 1
    memory = 1.5

    ports {
      port     = 80
      protocol = "TCP"
    }

    environment_variables = {
      CREATOR        = "ACI"
      REDIS_PORT     = "6380"
      REDIS_SSL_MODE = "true"
    }

    secure_environment_variables = {
      REDIS_URL      = var.redis_hostname
      REDIS_PASSWORD = var.redis_primary_key
    }
  }

  exposed_port {
    port     = 80
    protocol = "TCP"
  }
}