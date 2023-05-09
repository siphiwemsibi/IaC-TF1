terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "RG-Store"
    storage_account_name = "sipstore1"
    container_name = "labtfstate"
    key = "terralab.tfstate"
  }
}

provider "azurerm" {
  features {}
}