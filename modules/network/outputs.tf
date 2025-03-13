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
