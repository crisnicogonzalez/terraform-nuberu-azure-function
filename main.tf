resource "azurerm_resource_group" "this" {
  name     = "Function${var.name}"
  location = "East US"
}

resource "azurerm_storage_account" "this" {
  name                     = lower("Function${var.name}")
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
resource "azurerm_service_plan" "this" {
  name                = "Function${var.name}"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  os_type             = "Linux"
  sku_name            = "Y1"
}

resource "azurerm_container_registry" "this" {
  name                = lower("Function${var.name}")
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  sku                 = "Basic"
  admin_enabled       = true
}

resource "azurerm_application_insights" "this" {
  name                = "Function${var.name}"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  application_type    = "other"
}



resource "azurerm_linux_function_app" "this" {
  name                = "Function${var.name}"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location

  storage_account_name       = azurerm_storage_account.this.name
  storage_account_access_key = azurerm_storage_account.this.primary_access_key
  service_plan_id            = azurerm_service_plan.this.id

  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = false # WEBSITES_ENABLE_APP_SERVICE_STORAGE to false, since your app content is provided in the container itself
  }

  site_config {
    application_stack {
      docker {
        image_name        = "functhird"
        image_tag         = "latest"
        registry_url      = azurerm_container_registry.this.id
        registry_username = azurerm_container_registry.this.admin_username
        registry_password = azurerm_container_registry.this.admin_password
      }
    }
    application_insights_connection_string = azurerm_application_insights.this.connection_string
    application_insights_key               = azurerm_application_insights.this.instrumentation_key

    http2_enabled = true
  }
}
