#------------------------------------------------------------------------
# Infrastructure Bonfire Reproduction
#------------------------------------------------------------------------

data "azurerm_subscription" "this" {} # this subscription, that Terraform is running in

locals {
  tags = {
    DefaultTag = uuid()
  }
}


# Define the resource group
resource "azurerm_resource_group" "infra_rg" {
  name     = "infra-bonfire-rg"
  location = var.ae_location
  tags     = local.tags
}

# Provision a storage account
module "storage_account" {
  source              = "./modules/storage"
  resource_group_name = azurerm_resource_group.infra_rg.name

  depends_on = [
    azurerm_resource_group.infra_rg
  ]
}

