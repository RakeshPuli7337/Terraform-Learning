resource "azurerm_linux_virtual_machine" "vm" {
    name = var.vm_name
    resource_group_name = var.resource_group_name
    location = var.location
    size = var.vm_size
    admin_username  = "azureuser"

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
        storage_account_type = var.storage_account_type
    }
source_image_reference {
  publisher = var.os_image.publisher
  offer     = var.os_image.offer
  sku       = var.os_image.sku
  version   = var.os_image.version
}



    tags = {
    environment = "devops"
  }

}