resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "azurerm_virtual_machine" "vm" {
  name                  = var.vm_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.publique_interface.id]
  vm_size               = var.vm_size

  storage_os_disk {
    name              = "terra-disk"
    create_option     = "FromImage"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "20.04-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = var.vm_name
    admin_username = "adminuser"
    custom_data    = <<-EOT
                      #!/bin/bash
                      mkdir -p /home/adminuser/.ssh
                      echo "${tls_private_key.ssh_key.public_key}" > /home/adminuser/.ssh/authorized_keys
                      chown -R adminuser:adminuser /home/adminuser/.ssh
                      chmod 700 /home/adminuser/.ssh
                      chmod 600 /home/adminuser/.ssh/authorized_keys
                    EOT
  }

  tags = {
    "Environment" = "Test-Terra"
  }
}