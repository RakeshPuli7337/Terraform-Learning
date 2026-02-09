resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source              = "../../modules/network"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  nic_name            =  var.nic_name
  vnet_name           =  var.vnet_name
  subnet_name         =  var.subnet_name
  vnet_address_space  =  var.vnet_address_space
  vnet_subnet_address_space = var.subnet_address_space
}

module "vm" {
  source              = "../../modules/vm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  network_interface_id = module.network.nic_id
  vm_size=   var.vm_size
  storage_account_type = var.storage_account_type
  vm_name = var.vm_name
  os_image              = var.os_image
}

