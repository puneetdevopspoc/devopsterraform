provider "azurerm" {
 version = "=1.31.0"
}

module "resourcegroup" {
source = "../../module/Resourcegroup"
rgname  = "${upper("${var.rgname}-prod")}"
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
nicconfig= "${var.vmname}-prod-nic"
}

module "vm" {
source = "../../module/vm"
rgname  = "${module.resourcegroup.rg_name}"
rglocation = "${var.rglocation}"
vmname = "${upper("${var.vmname}-prod")}"
address_space = "${var.address_space}"
vnet =  "${var.vnet}"
subnet= "${var.subnet}"
subnet_addr= "${var.subnet_addr}"
#nicconfig= "${module.network.nic_name}"
vm_size = "${var.vm_size}"
admin_username = "${var.admin_username}"
admin_password = "${var.admin_password}"
network_interface_id="${module.network.nic}"
}
