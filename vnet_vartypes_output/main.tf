
resource "azurerm_resource_group" "example" {
  name     = var.rgname
  location = var.loc
}

resource "azurerm_virtual_network" "example" {
  name                = var.vnetname
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = var.vnetaddress
  subnet {
    name           = var.subnetname[0]
    address_prefix = var.subnetaddress[0]
  }

  subnet {
    name           = var.subnetname[1]
    address_prefix = var.subnetaddress[1]
  }

  tags = var.tagging
}