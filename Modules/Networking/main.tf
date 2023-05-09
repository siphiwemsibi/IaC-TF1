

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

