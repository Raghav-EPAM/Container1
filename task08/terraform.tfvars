#common values
location    = "eastus"
name_prefix = "cmtr-wp09pu9z-mod8"

#keyvault values
sku_name_keyvault = "standard"

#redis values
redis_capacity = 2
redis_family   = "C"
sku_name_redis = "Basic"

#acr values
sku_name_acr        = "standard"
github_context_path = "https://github.com/Raghav-EPAM/Container1.git"
git_pat             = "ghp_1234567890abcdef1234567890abcdef12345678"
image_tag           = "latest"

#aks values
node_count   = 1
vm_size      = "Standard_D2ads_v5"
os_disk_type = "Ephemeral"
tenant_id    = "b41b72d0-4e9f-4c26-8a69-f949f367c91d"
object_id    = "d43aa0ec-98db-499f-aa78-696387562913"