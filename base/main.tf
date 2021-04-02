################ Creating Resource group ####################

resource "azurerm_resource_group" "demo" {
  name     = var.rg_name
  location = var.location
}

############### Creating virtual Network ###################

resource "azurerm_virtual_network" "demo" {
  name                =  var.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.rg_name
  depends_on          = [azurerm_resource_group.demo]
}
