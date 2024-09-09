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
  features {}
}


module "test" {
  source = "../"
  name   = "NuberuPOC"
  location = "pepe"
}