variable "rg_name" {
  description = "Resource Group Name"
  type        = string
}
variable "vnet_name" {
  description = "Virtual Network Name"
  type        = string
}
variable "vnet_location" {
  description = "Virtual Network Location"
  type        = string
}
variable "vnet_Address_Space" {
  description = "Virtual Network Address Space"
  type        = list(string)
}
variable "subnet_Name" {
  description = "Subnet Name"
  type        = string
}
variable "address_prefixes" {
  description = "Subnet Address prefix"
  type        = list(string)
}
variable "vnet_tags" {
  description = "Virtual Netowrk Tags"
  type        = map(any)
  default     = null
}
variable "NSG_name" {
  description = "Network Security Group Name"
  type        = string
}
variable "NSG_Rule" {
  description = "NSG Port Numbers"
  type        = list(string)
}
variable "NSG_tags" {
  description = "Network Security tags"
  type        = map(any)
  default     = null
}
variable "NIC_Name" {
  description = "Network Interface Card Name"
  type        = string
}
variable "NIC_tags" {
  description = "Network interface tags"
  type        = map(any)
  default     = null
}
variable "PIP_Name" {
  description = "Public IP Address Name"
  type        = string
}
variable "PIP_tags" {
  description = "Public IP Address tags"
  type        = map(any)
  default     = null
}
variable "VM_Name" {
  description = "Virtual Machine Name"
  type        = string
}
variable "VM_Size" {
  description = "Size of the VM (ex:Standard_DS1_v2 )"
  type        = string
}
variable "VM_Admin_UN" {
  description = "The Username of the VM"
  type        = string
}
variable "VM_Admin_PW" {
  description = "The Password of the VM"
  type        = string
}
variable "vm_tags" {
  description = "Virtual Machine tags"
  type        = map(any)
  default     = null
}