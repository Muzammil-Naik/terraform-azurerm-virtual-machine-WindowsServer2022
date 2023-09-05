output "resource_group_name" {
  description = "The name of the newly created Resource Group"
  value       = var.rg_name
}
output "resource_group_location" {
  description = "The Location/Region where you deployed your Resource Group"
  value       = var.vnet_location
}
output "vnet_name" {
  description = "The name of the newly created Virtual Network"
  value       = azurerm_virtual_network.vnet.name
}
output "vnet_address_space" {
  description = "The Address space of newly created Virtual Network"
  value       = var.vnet_Address_Space
}
output "snet_address_prefixes" {
  description = "The Address Prefix of Newly Created Subnet"
  value       = var.address_prefixes
}
output "snet_name" {
  description = "The name of Newly created Subnet"
  value       = var.subnet_Name
}
output "nsg_name" {
  description = "The name of newly creaated NSG"
  value       = var.NSG_name
}
output "port_numbers" {
  description = "The Port numbers used in Network Security Rule"
  value       = var.NSG_Rule
}
output "pip" {
  description = "The Newly Created Public IP"
  value       = azurerm_public_ip.pip.id
}
output "nic_name" {
  description = "The Newly Created Network Interface Card Name"
  value       = var.NIC_Name
}
output "vm_name" {
  description = "The Newly created Virtual Machine Name"
  value       = azurerm_windows_virtual_machine.vm.name
}
output "vm_size" {
  description = "The newly Created Virtual Machine Size Family"
  value       = azurerm_windows_virtual_machine.vm.size
}
output "vm_username" {
  description = "The Username of Newly created Virtual MAchine"
  value       = azurerm_windows_virtual_machine.vm.admin_username
}