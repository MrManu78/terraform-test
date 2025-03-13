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
  default = "TerraGroup"
}

variable "address_range" {
  description = "range d'adresses pour le vnet"
  type        = list(string)
}

variable "public_subnet_name" {
  description = "nom du public subnet"
  type        = string
}

variable "public_subnet_prefix" {
  description = "range d'adresses pour le public subnet"
  type        = list(string)
}

variable "private_subnet_name" {
  description = "nom du private subnet"
  type        = string
}

variable "private_subnet_prefix" {
  description = "range d'adresses pour le privaet subnet"
  type        = list(string)
}
variable "sg_vnet_name" {
  description = "nom du security group lie au vnet (les rules sont definies par defaut dans le fichier 'resources')"
  type = string
}