
#---------------------------------------------------------------------
# Module: storage-account
#
# Creates an Azure Storage Account
#---------------------------------------------------------------------

data "azurerm_resource_group" "infra_rg" {
  name = var.resource_group_name
}


resource "azapi_resource" "storage_account" {
  type      = "Microsoft.Storage/storageAccounts@2022-05-01"
  name      = "awinfrabonfire"
  location  = data.azurerm_resource_group.infra_rg.location
  parent_id = data.azurerm_resource_group.infra_rg.id

  body = jsonencode({
    sku = {
      name = "Standard_LRS"
    }
    kind = "BlobStorage"
    properties = {
      minimumTlsVersion        = "TLS1_2"
      allowBlobPublicAccess    = true
      supportsHttpsTrafficOnly = true
      accessTier               = "Hot"
    }
  })

  ignore_missing_property   = true
  ignore_casing             = true
  schema_validation_enabled = false
}
