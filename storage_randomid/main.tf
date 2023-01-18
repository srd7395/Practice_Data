resource "azurerm_resource_group" "example" {
  name     = "pipeline-resources"
  location = "West Europe"
}

resource "random_id" "sa" {
  keepers = {
   resource_group = azurerm_resource_group.example.name
  }
  byte_length = 4
}
resource "azurerm_storage_account" "example" {
  name                     = "testt${random_id.sa.hex}"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
