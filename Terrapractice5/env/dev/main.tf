provider "azurerm" {
 version = "=1.31.0"
}

module "resourcegroup" {
source = "../../module/Resourcegroup"
rgname  = "${upper("${var.rgname}-dev")}"
rglocation = "${var.rglocation}"
}

module "network" {
source = "../../module/network"
rgname  = "${module.resourcegroup.rg_name}"
rglocation = "${var.rglocation}"
address_space = "${var.address_space}"
vnet =  "${var.vnet}"
subnet= "${var.subnet}"
subnet_addr= "${var.subnet_addr}"
nicconfig= "${var.vmname}-dev-nic"
}

module "vm" {
source = "../../module/vm"
rgname  = "${module.resourcegroup.rg_name}"
rglocation = "${var.rglocation}"
address_space = "${var.address_space}"
vnet =  "${var.vnet}"
subnet= "${var.subnet}"
subnet_addr= "${var.subnet_addr}"
#nicconfig= "${var.nicconfig}"
vm_size = "${var.vm_size}"
admin_username = "${var.admin_username}"
admin_password = "${var.admin_password}"
vmname = "${upper("${var.vmname}-dev")}"
network_interface_id="${module.network.nic}"
}







