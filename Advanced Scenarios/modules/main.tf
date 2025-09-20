

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_service_plan" "shared_plan" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Windows"
  sku_name            = var.app_service_plan_sku
}

module "webapps" {
  for_each   = toset(var.app_names)
  source     = "./webapp"
  myapp      = each.key
  myrg       = azurerm_resource_group.rg.name
  mylocation = azurerm_resource_group.rg.location
  myasp      = azurerm_service_plan.shared_plan.id
}

module "webapps2" {
  for_each   = toset(var.app2_names)
  source     = "./webapp"
  myapp      = each.key
  myrg       = azurerm_resource_group.rg.name
  mylocation = azurerm_resource_group.rg.location
  myasp      = azurerm_service_plan.shared_plan.id
}