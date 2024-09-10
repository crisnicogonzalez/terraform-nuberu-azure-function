terraform {
  backend "azurerm" {
    resource_group_name  = "genesis"
    storage_account_name = "nuberuterraformgenesis"
    container_name       = "tfstate"
    key                  = "/terraform-nuberu-azure-function/use-cases"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "cc3dc4a9-a505-4040-ae40-380b2bfdbf1b"
  features {}
}


module "test" {
  source = "../"
  name   = "NuberuPOC"
  region = "eastus2"
}