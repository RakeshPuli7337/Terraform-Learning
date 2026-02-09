location            = "australiaeast"
resource_group_name = "tf-devops-rg"
vm_size= "Standard_B2ats_v2"
storage_account_type =  "Standard_LRS"
vm_name = "tf-devops-vm"
nic_name = "tf-devops-nic"
vnet_name= "tf-devops-vnet"
subnet_name= "tf-devops-subnet"
vnet_address_space   = ["10.0.0.0/16"]
subnet_address_space = ["10.0.1.0/24"]
os_image = {
  publisher = "Canonical"
  offer     = "0001-com-ubuntu-server-jammy"
  sku       = "22_04-lts-gen2"
  version   = "latest"
}
