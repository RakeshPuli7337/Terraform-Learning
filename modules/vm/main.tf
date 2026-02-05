resource "azurerm_linux_virtual_machine" "vm" {
    name = "tf-devops-vm"
    resource_group_name = var.resource_group_name
    location = var.location
    size = "Standard_B2ats_v2"
    admin_username      = "azureuser"

      # Authentication
    admin_ssh_key {
    username   = "azureuser"
    public_key = file("/Users/pulicherlarakeshkumar/.ssh/id_rsa.pub")             # Your SSH public key
    }
   
   network_interface_ids = [
     var.network_interface_id
   ]
 
    os_disk {
        caching = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

source_image_reference {
  publisher = "Canonical"
  offer     = "0001-com-ubuntu-server-jammy"
  sku       = "22_04-lts-gen2"
  version   = "latest"
}


    tags = {
    environment = "devops"
  }

}