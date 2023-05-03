

variable "rgName" {
  default = "IaC-TF-RG"
}

variable "location" {
  default = "southafricanorth"
}

variable "vnetName" {
  default = "IaC-TF-VNET1"
}

variable "vnetAddress" {
  default = ["10.0.0.0/16"]
}

variable "subnetName" {
  default = "internal"
}

variable "subnetAddress" {
  default = ["10.0.2.0/24"]
}

variable "nicName" {
  default = "IaC-TF-NIC1"
}

variable "ipName" {
  default = "vm1-ip"
}


variable "ipAllocation" {
  default = "Dynamic"
}

variable "vmName" {
  default = "IaC-TF-VM1"
}

variable "vmSize" {
  default = "Standard_F2"
}

variable "vmUsername" {
  default = "adminuser"
}

variable "vmStoreAccount" {
  default = "Standard_LRS"
}

variable "imagePublisher" {
  default = "Canonical"
}

variable "imageOffer" {
  default = "UbuntuServer"
}

variable "imageSku" {
  default = "16.04-LTS"
}

variable "imageVersion" {
  default = "latest"
}
