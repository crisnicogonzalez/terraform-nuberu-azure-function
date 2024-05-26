resource "azurerm_resource_group" "this" {
  name     = "function-${var.name}"
  location = "East US"
}

# resource "azurerm_storage_account" "this" {
#   name                     = "function-${var.name}"
#   resource_group_name      = azurerm_resource_group.example.name
#   location                 = azurerm_resource_group.example.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }

# resource "azurerm_app_service_plan" "this" {
#   name                = "function-${var.name}"
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
#   kind                = "FunctionApp"
#   sku {
#     tier = "Dynamic"
#     size = "Y1"
#   }
# }

# resource "azurerm_container_registry" "example" {
#   name                = "function-${var.name}"
#   resource_group_name = azurerm_resource_group.example.name
#   location            = azurerm_resource_group.example.location
#   sku                 = "Basic"
#   admin_enabled       = true
# }

# resource "azurerm_function_app" "example" {
#   name                       = "example-functionap"
#   location                   = azurerm_resource_group.this.location
#   resource_group_name        = azurerm_resource_group.this.name
#   app_service_plan_id        = azurerm_app_service_plan.this.id
#   storage_account_name       = azurerm_storage_account.this.name
#   storage_account_access_key = azurerm_storage_account.this.primary_access_key
#   version                    = "~3"
#   app_settings = {
#     FUNCTIONS_WORKER_RUNTIME    = "custom"
#     WEBSITES_PORT               = "80"
#     DOCKER_REGISTRY_SERVER_URL  = azurerm_container_registry.this.login_server
#     DOCKER_REGISTRY_SERVER_USERNAME = azurerm_container_registry.this.admin_username
#     DOCKER_REGISTRY_SERVER_PASSWORD = azurerm_container_registry.this.admin_password
#     DOCKER_CUSTOM_IMAGE_NAME    = "${azurerm_container_registry.this.login_server}/yourimage:latest"
#   }
#   site_config {
#     linux_fx_version = "DOCKER|${azurerm_container_registry.this.login_server}/yourimage:latest"
#   }
# }