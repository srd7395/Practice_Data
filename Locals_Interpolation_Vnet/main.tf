locals {
  name_prefix = "${var.env}-${var.app}-${var.tier}"
}
resource "azurerm_resource_group" "eexample" {
 name = "${local.name_prefix}-${var.rgname}"
 location = var.location
 }

resource "azurerm_virtual_network" "eexample" {
  name                = "${local.name_prefix}-${var.vnetname}"
  address_space       = ["13.0.0.0/16"]
  location            = azurerm_resource_group.eexample.location
  resource_group_name = azurerm_resource_group.eexample.name
}

resource "azurerm_subnet" "eexample" {
  name                 = "${local.name_prefix}-${var.subnet1}"
  resource_group_name  = azurerm_resource_group.eexample.name
  virtual_network_name = azurerm_virtual_network.eexample.name
  address_prefixes     = ["13.0.1.0/24"]
}
resource "azurerm_subnet" "eexample2" {
  name                 = "${local.name_prefix}-${var.subnet1}"
  resource_group_name  = azurerm_resource_group.eexample.name
  virtual_network_name = azurerm_virtual_network.eexample.name
  address_prefixes     = ["13.0.2.0/24"]
}
resource "azurerm_subnet" "eexample3" {
  name                 = "${local.name_prefix}-${var.subnet1}"
  resource_group_name  = azurerm_resource_group.eexample.name
  virtual_network_name = azurerm_virtual_network.eexample.name
  address_prefixes     = ["13.0.3.0/24"]
}


