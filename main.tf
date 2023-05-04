
resource "azurerm_resource_group" "IaC-TF-RG" {
  name     = var.rgName
  location = local.location
}

resource "azurerm_virtual_network" "IaC-TF-VNET1" {
  name                = local.vnetName
  location            = azurerm_resource_group.IaC-TF-RG.location
  resource_group_name = azurerm_resource_group.IaC-TF-RG.name
  address_space       = local.vnetAddress

}

resource "azurerm_subnet" "IaC-TF-SUB1" {
  name                 = local.subnetName
  resource_group_name  = azurerm_resource_group.IaC-TF-RG.name
  virtual_network_name = azurerm_virtual_network.IaC-TF-VNET1.name
  address_prefixes     = local.subnetAddress
}

resource "azurerm_network_interface" "IaC-TF-NIC1" {
  name                = local.nicName
  location            = azurerm_resource_group.IaC-TF-RG.location
  resource_group_name = azurerm_resource_group.IaC-TF-RG.name

  ip_configuration {
    name                          = local.ipName
    subnet_id                     = azurerm_subnet.IaC-TF-SUB1.id
    private_ip_address_allocation = local.ipAllocation
  }
}

resource "tls_private_key" "VM1_ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "azurerm_linux_virtual_machine" "IaC-TF-VM1" {
  name                = local.vmName
  resource_group_name = azurerm_resource_group.IaC-TF-RG.name
  location            = azurerm_resource_group.IaC-TF-RG.location
  admin_username      = local.vmUsername
  size                = var.vmSize
  network_interface_ids = [
    azurerm_network_interface.IaC-TF-NIC1.id,
  ]

  admin_ssh_key {
    username   = local.vmUsername
    public_key = tls_private_key.VM1_ssh.public_key_openssh
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.vmStoreAccount
  }

  source_image_reference {
    publisher = var.imagePublisher
    offer     = var.imageOffer
    sku       = var.imageSku
    version   = var.imageVersion
  }
}

