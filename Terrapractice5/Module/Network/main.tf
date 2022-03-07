
provider "azurerm" {
 version = "=1.31.0"
}
resource "azurerm_virtual_network" "test1" {
  name                = "${var.vnet}"
  location            = "${var.rglocation}"
  resource_group_name = "${var.rgname}"
  address_space       = "${var.address_space}"
}
  
  resource "azurerm_subnet" "subnet" {
  name                 = "${element(var.subnet, count.index)}"
  resource_group_name  = "${var.rgname}"
  virtual_network_name = "${azurerm_virtual_network.test1.name}"
  address_prefix       = "${element(var.subnet_addr, count.index)}"
  count = "${length(var.subnet)}"
}

resource "azurerm_public_ip" "public-ip" {
  name                          = "Public-IP"
  location                      = "${var.rglocation}"
  resource_group_name           = "${var.rgname}"
  public_ip_address_allocation  = "Dynamic"
}

resource "azurerm_network_interface" "main" {
  name                = "${var.nicconfig}"
  location            = "${var.rglocation}"
  resource_group_name = "${var.rgname}"

  ip_configuration {
    name                          = "Private-ip1"
    subnet_id                     = "${azurerm_subnet.subnet.0.id}"
    private_ip_address_allocation = "Dynamic"
  }
}

