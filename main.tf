resource "azurerm_virtual_network" "vnet" { 
  resource_group_name = var.rg_name 
  name                = var.vnet_name 
  location            = var.vnet_location 
  address_space       = var.vnet_Address_Space 
} 
resource "azurerm_subnet" "snet" { 
  name                 = var.subnet_Name 
  virtual_network_name = azurerm_virtual_network.vnet.name 
  resource_group_name  = var.rg_name 
  address_prefixes     = var.address_prefixes 
} 
resource "azurerm_network_security_group" "nsg" { 
  name                = var.NSG_name 
  location            = var.vnet_location 
  resource_group_name = var.rg_name 
  dynamic "security_rule" { 
    for_each = var.NSG_Rule 
    iterator = each 
    content { 
      name                       = "Rule${each.value}" 
      priority                   = sum([300, each.key]) 
      direction                  = "Inbound" 
      access                     = "Allow" 
      protocol                   = "Tcp" 
      source_port_range          = "*" 
      destination_port_range     = each.value 
      source_address_prefix      = "*" 
      destination_address_prefix = "*" 
    } 
  } 
} 
resource "azurerm_network_interface" "nic" { 
  name                = var.NIC_Name 
  location            = var.vnet_location 
  resource_group_name = var.rg_name 
  ip_configuration { 
    name                          = "MainIP_Config" 
    subnet_id                     = azurerm_subnet.snet.id 
    private_ip_address_allocation = "Dynamic" 
    public_ip_address_id          = azurerm_public_ip.pip.id 
  } 
} 
resource "azurerm_public_ip" "pip" { 
  name                = var.PIP_Name 
  resource_group_name = var.rg_name 
  allocation_method   = "Static" 
  location            = var.vnet_location 
} 
resource "azurerm_windows_virtual_machine" "vm" { 
  name                  = var.VM_Name 
  location              = var.vnet_location 
  resource_group_name   = var.rg_name 
  size                  = "Standard_DS1_v2" 
  admin_username        = "vm" 
  admin_password        = "Muzzu$#123" 
  network_interface_ids = [azurerm_network_interface.nic.id] 
  os_disk { 
    caching              = "ReadWrite" 
    storage_account_type = "Standard_LRS" 
  } 
  source_image_reference { 
    publisher = "MicrosoftWindowsServer" 
    offer     = "WindowsServer" 
    sku       = "2022-Datacenter" 
    version   = "latest" 
  } 
} 