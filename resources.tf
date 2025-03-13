resource "azurerm_resource_group" "rg_terra"{
    name = var.rg_name
    location = var.location
}
module "network" {
  source = "./modules/network"
  vnet_name = "vnet-terra"
  location = var.location
  address_range = ["10.0.0.0/16"]
  public_subnet_name  = "public-subnet-terra"
  public_subnet_prefix = ["10.0.1.0/24"]
  private_subnet_name = "private-subnet-terra"
  private_subnet_prefix = ["10.0.2.0/24"]
  sg_vnet_name = "sg-vnet-terra"
  personal_public_ip = "0.0.0.0/0" #changer impérativement

  depends_on = [ azurerm_resource_group.rg_terra ]
}
