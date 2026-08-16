module "resource-group" {
  source = "../child_modules/azurerm_resource_group"
  rgs    = var.rgs
}
module "virtual-net" {
  source     = "../child_modules/azurerm_vnet"
  vnets      = var.vnets
  depends_on = [module.resource-group]
}
module "subnets" {
  source     = "../child_modules/azurerm_subnet"
  snets      = var.snets
  depends_on = [module.virtual-net]
}
module "public-ip" {
  source     = "../child_modules/azurerm_pip"
  pips       = var.pips
  depends_on = [module.resource-group]
}

module "virtual-machine" {
  source     = "../child_modules/azurerm_virtual_machine"
  nics-vms   = var.nics-vms
  snets      = var.snets
  pips       = var.pips
  depends_on = [module.subnets, module.public-ip]
}