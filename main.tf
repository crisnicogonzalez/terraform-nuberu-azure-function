resource "azurerm_resource_group" "this" {
  name     = "function${var.name}"
  location = "East US"
}

resource "azurerm_storage_account" "this" {
  name                     = "function${var.name}"
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
resource "azurerm_service_plan" "this" {
  name                = "example-app-service-plan"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  os_type             = "Linux"
  sku_name            = "Y1"
}

resource "azurerm_container_registry" "this" {
  name                = "function${var.name}"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  sku                 = "Basic"
  admin_enabled       = true
}

resource "azurerm_application_insights" "linux-application-insights" {
  name                = "application-insights-${var.name}"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  application_type    = "other"
}



resource "azurerm_linux_function_app" "this" {
  name                = "nuberu${var.name}"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location

  storage_account_name       = azurerm_storage_account.this.name
  storage_account_access_key = azurerm_storage_account.this.primary_access_key
  service_plan_id            = azurerm_service_plan.this.id

  site_config {
    application_insights_key               = azurerm_application_insights.linux-application-insights.instrumentation_key
    application_insights_connection_string = azurerm_application_insights.linux-application-insights.connection_string
    application_stack {
      python_version = 3.9 #FUNCTIONS_WORKER_RUNTIME        
    }
  }
}
