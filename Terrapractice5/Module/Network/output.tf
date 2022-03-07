output "nic" {
  value = "${azurerm_network_interface.main.id}"
}

output "nic_name" {
  value = "${azurerm_network_interface.main.name}"
}

