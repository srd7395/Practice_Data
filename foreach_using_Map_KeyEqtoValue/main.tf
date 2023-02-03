resource "azurerm_resource_group" "example" {
  name     = var.rgname
  location = var.location
}

resource "azurerm_virtual_network" "example" {
  name = var.vnetname
  location = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space = var.vnetaddress
}

resource "azurerm_subnet" "example" { # we will create 3 subnets using for_each
  for_each = var.subnetnames
  name = each.key # will check and assign key i.e subnet names
  virtual_network_name = azurerm_virtual_network.example.name
  resource_group_name = azurerm_resource_group.example.name
  address_prefixes = each.value # will check and assign value i.e subnet address
}
