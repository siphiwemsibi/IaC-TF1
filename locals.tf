
locals {
  //rgName = "IaC-TF-RG"
  location = "southafricanorth"
  vnetName = "IaC-TF-VNET1"
  vnetAddress = ["10.0.0.0/16"]
  subnetName = "internal"
  subnetAddress = ["10.0.2.0/24"]
  nicName = "IaC-TF-NIC1"
  ipName = "vm1-ip"
  ipAllocation = "Dynamic"
  vmName = "IaC-TF-VM1"
  vmUsername = "adminuser"

}


