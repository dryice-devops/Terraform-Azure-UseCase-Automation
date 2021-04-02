######### Fetch Info of existing Resources ###################

data "azurerm_subnet" subnet {
  name                 = var.subnet_name
  resource_group_name  = var.rg_name 
  virtual_network_name = var.vnet_name
}

data "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  resource_group_name = var.rg_name
}

############# Create Public Ip #################################

resource "azurerm_public_ip" "demo" {
  name                = var.pip_name
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"

  tags = {
      ENVIRONMENT = "Terraform Demo"
  }
} 

############# Create Network Interface #########################

resource "azurerm_network_interface" "demo" {
  name = var.network_int_name
  location = var.location
  resource_group_name = var.rg_name
 ip_configuration {
      name = "demo"
      subnet_id = data.azurerm_subnet.subnet.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id = azurerm_public_ip.demo.id
 }   
 tags = {
     ENVIRONMENT = "Terraform Demo"
 }
}

############### Connect the Security Groups to the network interface ###################

resource "azurerm_network_interface_security_group_association" "demo" {
  network_interface_id = azurerm_network_interface.demo.id
  network_security_group_id = data.azurerm_network_security_group.nsg.id
}    

############### Create virtual Machine #################################################

resource "azurerm_virtual_machine" "demo" {
  name = "demo-vm"
  location = var.location
  resource_group_name = var.rg_name
  network_interface_id = [azurerm_network_interface.demo.id]
  vm_size = var.node_size

  storage_image_reference {
    publisher = "Canonical"
    offer = "UbuntuServer"
    sku = "16.04-LTS"
    version = "latest" 
  }

  storage_os_disk {
    name = "demoosdisk"
    caching = "ReadWrite"
    create_option = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name = "demo-vm"
    admin_username = var.username
    admin_password = var.password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = { 
    ENVIRONMENT = "Terraform Demo"
  }
}
