
locals {
  name_prefix = "${var.organization}-${var.environment}-${var.app}-${var.tier}"
}


resource "azurerm_resource_group" "example" {
  name     = "${local.name_prefix}-${var.rgname}"
  location = var.loc
  tags = var.tagging
  }
  resource "azurerm_virtual_network" "example" {
  name                = "${local.name_prefix}-${var.vnet_name}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = var.vnet_address
  subnet {
    name           = "${var.vnet_name}-${var.subnet_name[0]}"
    address_prefix = var.subnet_address[0]
    
  }

  subnet {
    name           = "${var.vnet_name}-${var.subnet_name[1]}"
    address_prefix = var.subnet_address[1]

  }
  }

resource "azurerm_network_interface" "main" {
  name                = "${local.name_prefix}-${var.nic}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "testconfiguration1"
    #subnet_id                     = azurerm_virtual_network.example.subnet_id[0]
    subnet_id   =    tolist(azurerm_virtual_network.example.subnet)[0].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.public.id
    
  }
}

resource "azurerm_public_ip" "public"{
  name                = "${var.vnet_name}-${var.pip}"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  allocation_method   = "Static"

  tags = {
    environment = "Production"
  }

}

// NSG

resource "azurerm_network_security_group" "example" {
  name                = "${local.name_prefix}-${var.NSG}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "3389"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
}

resource "azurerm_virtual_machine" "main" {
  name                  = "${local.name_prefix}-${var.vmname}"
  location              = azurerm_resource_group.example.location
  resource_group_name   = azurerm_resource_group.example.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_windows_config {
    #disable_password_authentication = false
  }
  tags = var.tagging
}