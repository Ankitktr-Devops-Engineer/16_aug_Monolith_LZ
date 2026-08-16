data "azurerm_subnet" "name" {
  for_each = var.snets
  name = each.value.name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name = each.value.resource_group_name
}
data "azurerm_public_ip" "pipp" {
 for_each = var.pips
 name=each.value.name
 resource_group_name = each.value.resource_group_name 
}