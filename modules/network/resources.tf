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