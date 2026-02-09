variable "resource_group_name" {}
variable "location" {
}
variable "network_interface_id" {
  description = "NIC ID to attach to VM"
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

variable "os_image" {
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
}
