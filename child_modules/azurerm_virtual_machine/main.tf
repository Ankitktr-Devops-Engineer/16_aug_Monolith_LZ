resource "azurerm_network_interface" "nic-block" {
  for_each = var.nics-vms
  name = each.value.name_nic
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  ip_configuration {
    name = "internal"
    subnet_id = data.azurerm_subnet.name[each.value.subnet_key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = data.azurerm_public_ip.pipp[each.value.pip_key].id
  }
}
resource "azurerm_linux_virtual_machine" "vm-block" {
  for_each = var.nics-vms
  name = each.value.name_vm
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  admin_username = each.value.admin_username
  admin_password = each.value.admin_password
  size = each.value.size
  disable_password_authentication = "false"
  network_interface_ids = [azurerm_network_interface.nic-block[each.value.nic_key].id]
    os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}