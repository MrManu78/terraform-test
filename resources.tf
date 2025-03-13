resource "azurerm_resource_group" "rg_terra"{
    name = var.rg_name
    location = "francentral"
}
resource "aws_vpc" "terraform-vpc" {
  
}