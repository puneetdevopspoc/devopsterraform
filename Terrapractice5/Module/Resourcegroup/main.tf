provider "azurerm" {
 version = "=1.31.0"
}
resource "azurerm_resource_group" "test" {
  name     = "${var.rgname}"
  location = "${var.rglocation}"
}

