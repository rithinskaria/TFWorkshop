resource "azurerm_resource_group" "vm_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vm_vnet" {
  name                = var.vnet
  location            = azurerm_resource_group.vm_rg.location
  resource_group_name = azurerm_resource_group.vm_rg.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "vm_subnet" {
  name                 = var.subnet
  resource_group_name  = azurerm_resource_group.vm_rg.name
  virtual_network_name = azurerm_virtual_network.vm_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "vm_nic" {
  count               = 2
  name                = "vm-example-nic-${count.index + 1}"
  location            = azurerm_resource_group.vm_rg.location
  resource_group_name = azurerm_resource_group.vm_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.vm_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  count                 = 2
  name                  = "vm-example-${count.index + 1}"
  resource_group_name   = azurerm_resource_group.vm_rg.name
  location              = azurerm_resource_group.vm_rg.location
  size                  = "Standard_B1s"
  admin_username        = "adminuser"
  admin_password        = "Password1234!"
  disable_password_authentication = false
  network_interface_ids = [azurerm_network_interface.vm_nic[count.index].id]
  zone                  = count.index + 1  

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_10"
    sku       = "server"
    version   = "24.10.202410090"
  }
}
