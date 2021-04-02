################ Creating Subnet ###########################

resource "azurerm_subnet" "demo" {
  name                 =  var.subnet_name
  address_prefix       = ["10.0.0.2/24"]
  resource_group_name  = var.rg_name
  virtual_network_name = var.vnet_name
}

################# Creating NSG and Rule #####################

resource "azurerm_network_security_group" "demo" {
  name                =  var.nsg_name
  resource_group_name = var.rg_name
  location            = var.location
    security_rule {
    name                       = "HTTP"
    priority                   = 1020
    direction                  = "Inbound"
    access                     = "allow"
    protocol                   = "tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    }
tags = {
    ENVIRONMENT = "Terraform Demo"
    }    
}
