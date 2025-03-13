variable "vnet_name" {
  description = "nom du vnet"
  type        = string
}

variable "location" {
  description = "region azure"
  type        = string
}

variable "rg_name" {
  description = "nom du resource group"
  type        = string
}

variable "address_space" {
  description = "range d'adresses pour le vnet"
  type        = list(string)
}

variable "public_subnet_name" {
  description = "nom du public subnet"
  type        = string
}

variable "public_subnet_prefix" {
  description = "Address prefix for the public subnet"
  type        = list(string)
}

variable "private_subnet_name" {
  description = "Name of the private subnet"
  type        = string
}

variable "private_subnet_prefix" {
  description = "Address prefix for the private subnet"
  type        = list(string)
}