

resource "azurerm_resource_group" "rg" {
  name     = var.rg
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "RDP"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg-snet" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}


resource "azurerm_public_ip" "pip" {
  name                = var.pip
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "nic" {
  name                = var.nic
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_D8s_v3"
  admin_username      = "azureuser"
  admin_password      = "@p@55w06d!@DMIN" 
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "microsoft-dsvm"
    offer     = "ubuntu-2204"
    sku       = "2204-gen2"
    version   = "24.10.02"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo DEBIAN_FRONTEND=noninteractive apt-get -y install xfce4",
      "sudo apt install xfce4-session -y",
      "sudo apt-get -y install xrdp",
      "sudo systemctl enable xrdp",
      "sudo adduser xrdp ssl-cert",
      "echo xfce4-session > ~/.xsession",
      "sudo systemctl restart xrdp",
      "echo 'xRDP and XFCE4 desktop environment installation completed!'"
    ]

    connection {
      type        = "ssh"
      user        = "azureuser"
      password    = "@p@55w06d!@DMIN" 
      host        = azurerm_public_ip.pip.ip_address
      timeout     = "10m"
    }
  }
}

output "vm_public_ip" {
  description = "Public IP address of the Data Science VM"
  value = azurerm_public_ip.pip.ip_address
}

output "ssh_connection" {
  description = "SSH connection command"
  value = "ssh azureuser@${azurerm_public_ip.pip.ip_address}"
}

output "rdp_connection_info" {
  description = "RDP connection information"
  value = {
    ip_address = azurerm_public_ip.pip.ip_address
    username   = "azureuser"
    password   = "@p@55w06d!@DMIN"
    port       = "3389"
  }
}
