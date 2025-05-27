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
sku_name_acr        = "Standard"
github_context_path = "https://github.com/Raghav-EPAM/Container1.git#main:path/task08/application/"
git_pat             = "ghp_1234567890abcdef1234567890abcdef12345678"
image_tag           = "latest"

#aks values
node_count   = 1
vm_size      = "Standard_DS2_v2"
os_disk_type = "Ephemeral"