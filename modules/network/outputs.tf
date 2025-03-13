output "vnet_id" {
  description = "ID du vnet"
  value       = azurerm_virtual_network.vnet_terra.id
}

output "subnet_public_id" {
  description = "ID du public subnet"
  value       = azurerm_subnet.subnet_public.id
}

output "subnet_private_id" {
  description = "ID du private subnet"
  value       = azurerm_subnet.subnet_private.id
}

output "public_ip" {
  description = "public ip fournie"
  value = azurerm_public_ip.public_ip.id
  
}
output "interface_public" {
  description = "interface publique"
  value = azurerm_network_interface.publique_interface.id  
}
