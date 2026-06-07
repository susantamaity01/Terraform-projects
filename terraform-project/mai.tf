module "resource_group" {
  source = "./modules/RG"
  for_each = var.resource
  name = each.value.name
  location = each.value.location
}
module "storage" {
  source = "./modules/STR"
  for_each = var.storage
  name = each.value.name
  location = each.value.location
  account_tier = each.value.account_tier
  account_replication_type = each.value.account_replication_type
  resource_grouo_name = module.resource_group[each.value.rg_key].name
}
module "vnet01" {
  source = "./modules/Vnet"
  for_each = var.vnet01
  name = each.value.name
  location = each.value.location
  address_space = each.value.address_space
  resource_group_name = module.resource_group[each.value.rg_key].name
}
module "subnet" {
  source = "./modules/subnet"
  for_each = var.subnet
  name = each.value.name
  address_prefixes = each.value.address_prefixes
  resource_rgoup_name = module.resource_group[each.value.rg_key].name
  virtual_network_name = module.vnet01[each.value.vnet_key].name
}