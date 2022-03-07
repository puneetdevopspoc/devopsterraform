Application name :CRM

RG-DEV -- Resource Group
---------------------------------------------------------------------------------

1 Vnet 

3 subnets (Gateway Subnet/ App subnet / DB subnet)

2 nic's for APP VM. (Assign 2 Nic's to App subnet)
2 nic's for DB VM. (Assign 2 Nic's to DB subnet)

2 App VM's-> App subnet (Assign nic 01 and 02 to both App VM)
2 DB Vm's -> DB subnet (Assign nic 03 and 04 to both DB VM)

2 avaiabilty set: 
Map Avset01 to App VM
Map Avset02 to DB VM
1 Storage account.
----------------------------------------------------------------------------------------
