# variable "rgs" {}
# variable "vnets" {}
# variable "snets" {}
# variable "pips" {}
# variable "nics-vms" {}
variable "rgs" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "vnets" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
  }))
}

variable "snets" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}

variable "pips" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
  }))
}

variable "nics-vms" {
  type = map(object({
    name_nic           = string
    location           = string
    resource_group_name = string
    name_vm            = string
    admin_username     = string
    admin_password     = string
    size               = string
    subnet_key         = string
    pip_key            = string
    nic_key            = string
  }))
}