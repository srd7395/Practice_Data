resource "azurerm_resource_group" "bnryrg" {
   name = var.rgname
   location = var.loc
  
}

resource "azurerm_public_ip" "bnryrg" {
    name = var.pipname
    resource_group_name = azurerm_resource_group.bnryrg.name
    location = azurerm_resource_group.bnryrg.location
    allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
}
