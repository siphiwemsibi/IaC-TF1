terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "rg_tfstate"
    storage_account_name = "siptfstateacc"
    container_name = "labtfstate"
    key = "terralab.tfstate"
  }
}

provider "azurerm" {
  features {}
}