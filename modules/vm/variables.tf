variable "location" {
  description = "Location of the resources"
  type = string
}

variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type = string
}

variable "vm_name" {
  description = "The name of the virtual machine"
  type = string
}

variable "vm_size" {
  description = "The size of the virtual machine"
  type = string
}
variable "vm_network_interface" {
    description = "nic"
    type = list(string)
}