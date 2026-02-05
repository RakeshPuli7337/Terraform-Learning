resource "azurerm_virtual_network" "vnet" {
    name = "tf-devops-vnet"
    address_space = ["10.0.0.0/16"]
    resource_group_name = var.resource_group_name 
    location = var.location
}

resource "azurerm_subnet" "subnet" {
  name                 = "tf-devops-subnet"
  resource_group_name  = var.resource_group_name 
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}


resource "azurerm_network_interface" "nic" {
    name = "tf-devops-nic"
    location= var.location
    resource_group_name = var.resource_group_name
    ip_configuration {
        name = "internal"
        subnet_id= azurerm_subnet.subnet.id
        private_ip_address_allocation = "Dynamic"
    }
}

resource "azurerm_network_security_group" "nsg" {
  name                = "tf-devops-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_rule" "ssh" {
  name                        = "allow-ssh"
  priority                    = 100
  direction                   = "Inbound"
  access                       = "Allow"
  protocol                     = "Tcp"
  source_port_range            = "*"
  destination_port_range       = "22"
  source_address_prefix        = "*"
  destination_address_prefix  = "*"
  resource_group_name          = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_subnet_network_security_group_association" "nsg_subnet" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
