
rgname  = "example-rg"
rglocation = "Eastus2"
address_space = ["10.0.0.0/16"]
vnet =  "example-vnet1"
subnet= ["Gateway_Subnet", "App_subnet", "Database_Subnet"]
subnet_addr= ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
#nicconfig="nicd_ip1"
vm_size = "Standard_DS1_v2"
admin_username = "adminuser"
admin_password = "P@$$w0rd1234!"
vmname = "vm"

