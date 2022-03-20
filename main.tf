terraform {
  required_version = "1.1.7" #"=0.14.2"
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
  subscription_id = "" # Input Sub to use.
  features {
    key_vault {
      purge_soft_delete_on_destroy    = false
      recover_soft_deleted_key_vaults = true
    }
  }
}