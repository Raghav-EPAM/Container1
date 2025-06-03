#common values
location    = "westus"
name_prefix = "cmtr-wp09pu9z-mod8"

#keyvault values
sku_name_keyvault = "standard"

#redis values
redis_capacity = 2
redis_family   = "C"
sku_name_redis = "Basic"

#acr values
sku_name_acr        = "Basic"
github_context_path = "https://github.com/Raghav-EPAM/Container1#main:task08/application"
git_pat             = ""
image_tag           = "latest"
docker_image_name   = ""

#aks values
node_count = 1

#aci values
aci_container_environment_variables = {
  "CREATOR"        = "ACI",
  "REDIS_PORT"     = "6380",
  "REDIS_SSL_MODE" = "True",
}