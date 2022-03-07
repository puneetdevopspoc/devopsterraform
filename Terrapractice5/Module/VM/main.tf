
provider "azurerm" {
 version = "=1.31.0"
}
resource "azurerm_virtual_machine" "main" {
name                = "${var.vmname}"
location            = "${var.rglocation}"
resource_group_name = "${var.rgname}"
network_interface_ids               = ["${var.network_interface_id}"]
vm_size                             = "Standard_DS1_v2"
delete_os_disk_on_termination       = true
delete_data_disks_on_termination    = true

    storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
    }

    storage_os_disk {
    name              = "${var.vmname}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
    }

    os_profile {
    computer_name  = "${var.vmname}"
    admin_username = "${var.admin_username}"
    admin_password = "${var.admin_password}"
    }
    os_profile_linux_config {
    disable_password_authentication = false
    }
}