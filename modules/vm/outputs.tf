output "ssh_public_key" {
  description = "ssh public key"
  value = tls_private_key.ssh_key.public_key_openssh
  }
