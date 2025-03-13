resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "azurerm_linux_virtual_machine" "vm" {
  name = var.vm_name
  location = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = var.vm_network_interface
  size = var.vm_size
  admin_username = "adminuser"
  
  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "canonical"
    offer= "0001-com-ubuntu-server-focal"
    sku = "20_04-lts"
    version = "latest"
  }

   admin_ssh_key {
    username = "adminuser"
    public_key = tls_private_key.ssh_key.public_key_openssh
  }

  tags = {
    "Environment" = "Test-Terra"
  }
}