# IMPORTANT NOTE: this code is just for demonstration purposes
data "azurerm_client_config" "current" {}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "arbitrary-resource-group"
  location = var.default_location
}

# Storage Account
resource "azurerm_storage_account" "sa" {
  resource_group_name             = azurerm_resource_group.rg.name
  name                            = "arbitrarysa"
  location                        = var.default_location
  account_tier                    = "Standard"
  account_replication_type        = "GRS"
  shared_access_key_enabled       = false
  default_to_oauth_authentication = true
  min_tls_version                 = "TLS1_0" # Security issue to be detected by SonarCloud
}

resource "azurerm_role_assignment" "blob-data-owner" {
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Storage Blob Data Owner"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_role_assignment" "rg-contributor" {
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Contributor"
  principal_id         = data.azurerm_client_config.current.object_id
}
