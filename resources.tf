resource "azurerm_resource_group" "rg_terra"{
    name = var.rg_name
    location = var.location
}
resource "azurerm_virtual_network" "vnet_terra" {
  name                = "Terraform_test_vnet"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg_terra.name
  address_space       = ["172.16.0.0/20"]

  tags = {
    environment = "test-terra"
  }
}