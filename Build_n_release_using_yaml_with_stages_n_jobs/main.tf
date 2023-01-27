resource "azurerm_resource_group" "bnrrg" {
   name = var.rgname
   location = var.loc
  
}

resource "azurerm_public_ip" "bnrrg" {
    name = var.pipname
    resource_group_name = azurerm_resource_group.bnrrg.name
    location = azurerm_resource_group.bnrrg.location
    allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
}
