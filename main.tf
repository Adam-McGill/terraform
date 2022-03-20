terraform {
  required_version = "1.1.7"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      #version = "=2.33.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "566bb512-2525-475b-9659-e9acdc19db11" # Input Sub to use.
  features {
    key_vault {
      purge_soft_delete_on_destroy    = false
      recover_soft_deleted_key_vaults = true
    }
  }
}

#module "resource_group" {
#  source = "https://github.com/Adam-McGill/terraform-aks/tree/main/Modules/resource_group"
#}