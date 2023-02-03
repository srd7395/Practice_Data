data "azurerm_resource_group" "example" { # data block for creating resources in the existing rg
name = data.terraform_remote_state.tf.outputs.rg # remote block to avoid data block variable hard coding in data.tf / give outputs.rg the output of resoucegroup should be in output form.
}

resource "azurerm_virtual_network" "example" {
  name = var.vnet
  address_space = var.vnetaddress
  location = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name
}

resource "azurerm_subnet" "example" {
  name = var.subnet
  resource_group_name = data.azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes = var.subnetaddress
}