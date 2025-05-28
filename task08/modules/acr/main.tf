resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = var.sku
  admin_enabled       = true
  tags                = var.tags
}

resource "azurerm_container_registry_task" "acr_task" {
  name                  = "${var.acr_name}-build-task"
  container_registry_id = azurerm_container_registry.acr.id

  platform {
    os = "Linux"
  }


  docker_step {
    dockerfile_path      = "Dockerfile"
    context_path         = var.github_context_path
    context_access_token = var.git_pat
    image_names          = [var.docker_image_name]
  }
  depends_on = [azurerm_container_registry.acr]
}

resource "azurerm_container_registry_task_schedule_run_now" "acr_task_run_now" {
  container_registry_task_id = azurerm_container_registry_task.acr_task.id
}