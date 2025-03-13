resource "azurerm_virtual_network" "vnet_terra" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.rg_name
  address_space = var.address_range
  tags = {
    environment = "test-terra"
  }

}
resource "azurerm_subnet" "subnet_public" {
    name = var.public_subnet_name
    resource_group_name = var.rg_name
    address_prefixes = var.public_subnet_prefix
    virtual_network_name = azurerm_virtual_network.vnet_terra.name
  
}
resource "azurerm_subnet" "subnet_private" {
  name                 = var.private_subnet_name
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet_terra.name
  address_prefixes     = var.private_subnet_prefix
}

resource "azurerm_network_security_group" "sg_vnet_terra" {
  name                = var.sg_vnet_name
  location            = var.location
  resource_group_name = var.rg_name

  security_rule {
    name                       = "allow_ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = var.personal_public_ip
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "allow_https"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}