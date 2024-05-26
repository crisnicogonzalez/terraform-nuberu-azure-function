terraform {
  backend "azurerm" {
    resource_group_name   = "terraform-backend"
    storage_account_name  = "nuberuterraformbackend"
    container_name        = "tfstate"
    key                   = "use-cases/pepe"
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
  name = "pepe"
}