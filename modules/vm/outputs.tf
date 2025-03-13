output "public_ip" {
  description = "ip public vm"
  value = azurerm_public_ip.public_ip.ip_address
}

output "ssh_public_key" {
  description = "ssh public key"
  value = tls_private_key.ssh_key.public_key_pem
  }
