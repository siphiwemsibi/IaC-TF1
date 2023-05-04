variable "rgName" {
  default = "IaC-TF-RG"
}

variable "vmSize" {
  default = "Standard_F2"
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
