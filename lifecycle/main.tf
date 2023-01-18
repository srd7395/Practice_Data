resource "azurerm_resource_group" "example" {
  name     = "example-rg"
  location = "West Europe"
}

resource "azurerm_public_ip" "example" {
  name                = "acceptanceTestPublicIp2"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  allocation_method   = "Static"
  lifecycle {
    #create_before_destroy = true
    #prevent_destroy = true
    ignore_changes = [name]
  }
  tags = {
    environment = "Prod"
  }
}