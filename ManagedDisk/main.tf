 resource "azurerm_resource_group" "rg" {
 name = var.rgname
 location = var.rglocation
 }

 resource "azurerm_managed_disk" "rg" {
  name = var.diskname
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  storage_account_type = var.satype
  create_option        = "Empty"
  disk_size_gb         = var.disksize

  tags = {
    environment = "staging"
  }
 }