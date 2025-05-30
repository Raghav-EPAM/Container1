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
sku_name_acr        = "Basic"
github_context_path = "https://github.com/Raghav-EPAM/Container1#main:task08/application"
git_pat             = "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"
image_tag           = "latest"

#aks values
node_count = 1