rgs = {
  rg1 = {
    name     = "india"
    location = "central india"
  }
  rg2 = {
    name     = "china"
    location = "west us"
  }
  rg3 = {
    name     = "humana"
    location = "central india"
  }
}
vnets = {
  vnet1 = {
    name                = "test-vnet"
    location            = "central india"
    resource_group_name = "india"
    address_space       = ["10.0.0.0/16"]
  }
}
snets = {
  snet1 = {
    name                 = "first_subnet"
    resource_group_name  = "india"
    virtual_network_name = "test-vnet"
    address_prefixes     = ["10.0.2.0/24"]
  }
  snet2 = {
    name                 = "second_subnet"
    resource_group_name  = "india"
    virtual_network_name = "test-vnet"
    address_prefixes     = ["10.0.3.0/24"]
  }
}
pips = {
  pip = {
    name                = "public-zone"
    resource_group_name = "india"
    location            = "central india"
  }
}
nics-vms = {
  nic1-vm1 = {
    name_nic            = "nic-first"
    location            = "central india"
    resource_group_name = "india"
    name_vm             = "public-vm"
    location            = "central india"
    admin_username      = "devops"
    admin_password      = "Qwerty@123"
    size                = "Standard_D4_v5"
    subnet_key          = "snet1"
    pip_key             = "pip"
    nic_key             = "nic1-vm1"
  }
}