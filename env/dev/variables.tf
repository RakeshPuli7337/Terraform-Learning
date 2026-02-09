variable "location" {
  description = "Azure region"
}

variable "resource_group_name" {
  description = "Resource group name"
}

variable "vm_size" {
  type = string
}

variable "storage_account_type" {
  type = string
}

variable "vm_name" {
  type = string
}

variable "nic_name" {
  type = string
}

variable "vnet_name" {
  type = string
}
variable "subnet_name" {
  type = string
}

variable "vnet_address_space" {
  type = list(string)
}

variable "subnet_address_space" {
  type = list(string)
}

variable "os_image" {
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
}
