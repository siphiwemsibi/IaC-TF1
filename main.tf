
resource "azurerm_resource_group" "IaC-TF-RG" {
  name     = "IaC-TF-RG"
  location = "saf-north"
}

resource "azurerm_virtual_network" "IaC-TF-VNET1" {
  name                = "IaC-TF-VNET1"
  location            = azurerm_resource_group.IaC-TF-RG.location
  resource_group_name = azurerm_resource_group.IaC-TF-RG.name
  address_space       = ["10.0.0.0/16"]

}

resource "azurerm_subnet" "IaC-TF-SUB1" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.IaC-TF-RG.name
  virtual_network_name = azurerm_virtual_network.IaC-TF-VNET1.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "IaC-TF-NIC1" {
  name                = "IaC-TF-NIC1"
  location            = azurerm_resource_group.IaC-TF-RG.location
  resource_group_name = azurerm_resource_group.IaC-TF-RG.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.IaC-TF-SUB1.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "IaC-TF-VM1" {
  name                = "IaC-TF-VM1"
  resource_group_name = azurerm_resource_group.IaC-TF-RG.name
  location            = azurerm_resource_group.IaC-TF-RG.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.IaC-TF-NIC1.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}

