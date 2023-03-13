
terraform {
  #backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.40.0"
    }
    azapi = {
      source  = "Azure/azapi"
      version = "1.3.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
}

provider "azapi" {
  # Configuration options
}

provider "azuread" {
  tenant_id = "6f0e7657-1985-4cc9-9a41-d6ebe342d2e4"
}
