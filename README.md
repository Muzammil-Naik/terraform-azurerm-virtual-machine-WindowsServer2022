## terraform-azurerm-virtual-machine-windows

### Deploy a basic Windows Virtual Machine (Windows Server 2022 Datacenter)
This Terraform module provides a flexible and reusable solution for deploying Windows Virtual Machines (Windows Server 2022 Datacenter) on Azure cloud provider. It abstracts the complexities of VM creation, networking, and configuration, allowing you to quickly spin up Windows-based Virtual Machine with minimal configuration effort.

### Features:
- **Easy Customization**: Quickly deploy Windows VMs tailored to your application's requirements. Configure VM size, networking, and more through simple input variables.
- **Security Considerations**: Implement security best practices effortlessly by enabling features such as managed disk encryption, network security groups.
- **Tagging and Categorization**: Easily apply tags and labels to the VM resources for better organization, cost allocation, and management.
- **Remote Desktop Access**: Enable Remote Desktop Protocol (RDP) access to Windows VMs, allowing remote administration and troubleshooting.
- **Module Reusability**: Designed with modularity in mind, you can reuse this module across various projects, reducing duplication and maintaining a consistent deployment approach.
- **Infrastructure as Code**: Leverage the power of Infrastructure as Code (IaC) principles by describing your VM infrastructure in code. This ensures version control, collaboration, and reproducibility.


### Example Usage 
```hcl
module "windows_vm" {
    source             = "path/to/windows-vm-module"
    rg_name            = "del" 
    vnet_name          = "eastus-vnet" 
    vnet_location      = "eastus" 
    vnet_Address_Space = ["10.0.0.0/16"] 
    subnet_Name        = "eastus-snet" 
    address_prefixes   = ["10.0.1.0/24"] 
    NSG_name           = "eastus_NSG" 
    NSG_Rule           = ["80", "443", "3389"] 
    NIC_Name           = "mainnic" 
    PIP_Name           = "eastusPIP" 
    VM_Name            = "delvm" 
    VM_Size            = "Standard_DS1_v2" 
    VM_Admin_UN        = "UserName" 
    VM_Admin_PW        = "********" 
}
```